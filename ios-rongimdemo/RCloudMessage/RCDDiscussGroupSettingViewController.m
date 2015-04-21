//
//  RCDiscussGroupSettingViewController.m
//  RongIMToolkit
//
//  Created by Liv on 15/3/30.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCDDiscussGroupSettingViewController.h"
#import "RCDUpdateNameViewController.h"
#import "RCDDiscussSettingCell.h"
#import "RCDDiscussSettingSwitchCell.h"
#import "RCDSelectPersonViewController.h"
#import "RCDChatViewController.h"
#import "RCDHttpTool.h"


@interface RCDDiscussGroupSettingViewController ()

@property (nonatomic, copy) NSString* discussTitle;

@property (nonatomic, strong) NSArray* members;

@end

@implementation RCDDiscussGroupSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //显示顶部视图
    self.headerHidden = NO;
    
    //添加当前聊天用户
    if (self.conversationType == ConversationType_PRIVATE) {

        [RCDHTTPTOOL getUserInfoByUserID:self.targetId
                              completion:^(RCUserInfo* user) {
                                          [self addUsers:@[user]];
                                          _members = @[user];

                              }];
    }

    //添加讨论组成员
    if (self.conversationType == ConversationType_DISCUSSION) {

        __weak RCSettingViewController* weakSelf = self;
        [[RCIMClient sharedClient] getDiscussion:self.targetId completion:^(RCDiscussion* discussion) {
            if (discussion) {
                
                if([[RCIMClient sharedClient].currentUserInfo.userId isEqualToString:discussion.creatorId])
                {
                    [self disableDeleteMemberEvent:NO];
                    
                }else{
                    [self disableDeleteMemberEvent:YES];
                }
                
                NSMutableArray *users = [NSMutableArray new];
                
                for (NSString *targetId in discussion.memberIdList) {
                        [RCDHTTPTOOL getUserInfoByUserID:targetId
                                                              completion:^(RCUserInfo *user) {
                                                                  [users addObject:user];
                                                                  _members = users;
                                                                  [weakSelf addUsers:users];
                                                              }];
                    
                }
                
            }
        } error:^(RCErrorCode status){

        }];
    }
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.defaultCells.count + 2;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 44.f;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell* cell = nil;
    switch (indexPath.row) {
        case 0:
        {
            RCDDiscussSettingCell *discussCell = [[RCDDiscussSettingCell alloc] initWithFrame:CGRectZero];
            discussCell.lblDiscussName.text = self.conversationTitle;
            discussCell.lblTitle.text = @"讨论组名称";
            cell = discussCell;
            _discussTitle = discussCell.lblDiscussName.text;
        }
            break;
        case 1:
        {
            RCDDiscussSettingSwitchCell *switchCell = [[RCDDiscussSettingSwitchCell alloc] initWithFrame:CGRectZero];
            switchCell.label.text = @"开放成员邀请";
            [[RCIMClient sharedClient] getDiscussion:self.targetId completion:^(RCDiscussion *discussion) {
                if (discussion.inviteStatus == 0) {
                    switchCell.swich.on = YES;
                }
        } error:^(RCErrorCode status){

        }];
        [switchCell.swich addTarget:self action:@selector(openMemberInv:) forControlEvents:UIControlEventTouchUpInside];
        cell = switchCell;

    } break;
    case 2: {
        cell = self.defaultCells[0];
    } break;
    case 3: {
        cell = self.defaultCells[1];

    } break;
    case 4: {
        cell = self.defaultCells[2];

    } break;
    }

    return cell;
}

#pragma mark - RCConversationSettingTableViewHeader Delegate
//点击最后一个+号事件
- (void)settingTableViewHeader:(RCConversationSettingTableViewHeader*)settingTableViewHeader indexPathOfSelectedItem:(NSIndexPath*)indexPathOfSelectedItem
            allTheSeletedUsers:(NSArray*)users
{
    //点击最后一个+号,调出选择联系人UI
    if (indexPathOfSelectedItem.row == settingTableViewHeader.users.count) {

        UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RCDSelectPersonViewController* selectPersonVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"RCDSelectPersonViewController"];
        [selectPersonVC setSeletedUsers:users];
        //设置回调
        selectPersonVC.clickDoneCompletion = ^(RCDSelectPersonViewController* selectPersonViewController, NSArray* selectedUsers) {
            
            if (selectedUsers && selectedUsers.count) {
                
                NSString *_currentTargetId = [RCIMClient sharedClient].currentUserInfo.userId;
                
                                [RCDHTTPTOOL getUserInfoByUserID:_currentTargetId completion:^(RCUserInfo *user) {
                                    RCUserInfo *userInfo =  user;
                                    NSMutableArray *_allUsers = [NSMutableArray new];
                                    [_allUsers addObject:userInfo];//add current user info object
                                    [_allUsers addObjectsFromArray:selectedUsers];//add the selected users
                                    [self addUsers:(NSArray *)_allUsers];
                
                                    [self createDiscussionOrInvokeMemberWithSelectedUsers:selectedUsers];
                
                                }];

                
            }
            
            [selectPersonViewController.navigationController popViewControllerAnimated:YES];
        };
        [self.navigationController pushViewController:selectPersonVC animated:YES];
    }
}

#pragma mark - private method
- (void)createDiscussionOrInvokeMemberWithSelectedUsers:(NSArray*)selectedUsers
{
    //    __weak RCDSettingViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (ConversationType_DISCUSSION == self.conversationType) {
            //invoke new member to current discussion
            
            NSMutableArray *addIdList = [NSMutableArray new];
            for (RCUserInfo *user in selectedUsers) {
                [addIdList addObject:user.userId];
            }
            
            //加入讨论组
            if(addIdList.count != 0){
                
                [[RCIMClient sharedClient] addMemberToDiscussion:self.targetId userIdList:addIdList completion:^(RCDiscussion *discussion) {
                } error:^(RCErrorCode status) {
                    
                }];
            }
            
        }else if (ConversationType_PRIVATE == self.conversationType)
        {
            //create new discussion with the new invoked member.
            NSUInteger _count = [selectedUsers count];
            if (_count > 1) {
                NSMutableString *discussionTitle = [NSMutableString string];
                
                NSMutableArray *userIdList = [NSMutableArray new];
                
                for (int i=0; i<_count; i++) {
                    RCUserInfo *_userInfo = (RCUserInfo *)selectedUsers[i];
                    
                    if (i == (_count - 1)) {
                        [discussionTitle appendString:_userInfo.name];
                    }else{
                        [discussionTitle appendString:[NSString stringWithFormat:@"%@%@", _userInfo.name,@","]];
                    }
                    
                    [userIdList addObject:_userInfo.userId];
                }
                
                self.conversationTitle = discussionTitle;
                __weak typeof(&*self)  weakSelf = self;
                [[RCIMClient sharedClient] createDiscussion:discussionTitle userIdList:userIdList completion:^(RCDiscussion *discussion) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        RCDChatViewController *chat =[[RCDChatViewController alloc]init];
                        chat.targetId                      = discussion.discussionId;
                        chat.targetName                    = discussion.discussionName;
                        chat.conversationType              = ConversationType_DISCUSSION;
                        chat.title                         = discussionTitle;//[NSString stringWithFormat:@"讨论组(%lu)", (unsigned long)_count];
                        
                        UITabBarController *tabbarVC = weakSelf.navigationController.viewControllers[0];
                        [weakSelf.navigationController popToViewController:tabbarVC animated:YES];
                        [tabbarVC.navigationController  pushViewController:chat animated:YES];
                    });
                } error:^(RCErrorCode status) {
                    //            DebugLog(@"create discussion Failed > %ld!", (long)status);
                }];
            }
            
        }
    });
}

- (void)openMemberInv:(UISwitch*)swch
{
    //设置成员邀请权限


    [[RCIMClient sharedClient] setDiscussionInviteStatus:self.targetId isOpen:swch.on completion:^{
//        DebugLog(@"设置成功");
    } error:^(RCErrorCode status) {
        
    }];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    if (self.setDiscussTitleCompletion) {
        self.setDiscussTitleCompletion(_discussTitle);
    }
}

- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.row == 0) {
        RCDDiscussSettingCell* discussCell = (RCDDiscussSettingCell*)[tableView cellForRowAtIndexPath:indexPath];
        discussCell.lblTitle.text = @"讨论组名称";

        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RCDUpdateNameViewController* updateNameViewController = [storyboard instantiateViewControllerWithIdentifier:@"RCDUpdateNameViewController"];
        updateNameViewController.targetId = self.targetId;
        updateNameViewController.displayText = discussCell.lblDiscussName.text;
        updateNameViewController.setDisplayTextCompletion = ^(NSString* text) {
            discussCell.lblDiscussName.text = text;
            _discussTitle = text;

        };
        UINavigationController* navi = [[UINavigationController alloc] initWithRootViewController:updateNameViewController];
        [self.navigationController presentViewController:navi animated:YES completion:nil];
    }
}

/**
 *  override
 *
 *  @param 添加顶部视图显示的user,必须继承以调用父类添加user
 */
- (void)addUsers:(NSArray*)users
{
    [super addUsers:users];
}

/**
 *  override 左上角删除按钮回调
 *
 *  @param indexPath indexPath description
 */
- (void)deleteTipButtonClicked:(NSIndexPath*)indexPath
{
    RCUserInfo* user = self.users[indexPath.row];
    [[RCIMClient sharedClient] removeMemberFromDiscussion:self.targetId userId:user.userId completion:^(RCDiscussion *discussion) {
        
    } error:^(RCErrorCode status) {
        
    }];
}





@end
