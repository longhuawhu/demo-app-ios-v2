//
//  RCDChatViewController.m
//  RCloudMessage
//
//  Created by Liv on 15/3/13.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import "RCDChatViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "RCDChatViewController.h"
#import "RCDDiscussGroupSettingViewController.h"
#import "RCDRoomSettingViewController.h"
#import "RCDPrivateSettingViewController.h"

@interface RCDChatViewController ()

@end

@implementation RCDChatViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

   
    NSString *__string = @"返回";
    int unreadMsgCount = [[RCIMClient sharedClient]getUnreadCount: @[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE), @(ConversationType_PUBLICSERVICE),@(ConversationType_GROUP)]];
    if (0 < unreadMsgCount) {
        __string = [NSString  stringWithFormat:@"返回(%d)",unreadMsgCount];
    }
 
    //添加rightBarButtonItem事件
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(rightBarButtonItemClicked:)];
    //添加leftBarButtonItem点击事件
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:__string
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(leftBarButtonItemPressed:)];
    
    
}

-(void) leftBarButtonItemPressed:(id)sender
{
    //需要调用super的实现
    [super leftBarButtonItemPressed:sender];
    
    [self.navigationController popViewControllerAnimated:YES];
}


/**
 *  此处使用自定义设置，开发者可以根据需求自己实现
 *  不添加rightBarButtonItemClicked事件，则使用默认实现。
 */
-(void) rightBarButtonItemClicked:(id) sender
{
    if (self.conversationType == ConversationType_PRIVATE) {
        
        RCDPrivateSettingViewController *settingVC = [[RCDPrivateSettingViewController alloc] init];
        settingVC.conversationType = self.conversationType;
        settingVC.targetId = self.targetId;
        settingVC.conversationTitle = self.targetName;
        //设置讨论组标题时，改变当前聊天界面的标题
        settingVC.setDiscussTitleCompletion = ^(NSString *discussTitle){
            self.title = discussTitle;
        };
        //清除聊天记录之后reload data
        __weak RCDChatViewController *weakSelf = self;
        settingVC.clearHistoryCompletion = ^(BOOL isSuccess)
        {
            if (isSuccess) {
                [weakSelf.conversationDataRepository removeAllObjects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.conversationMessageCollectionView reloadData];
                });
            }
        };
        
        
        [self.navigationController pushViewController:settingVC animated:YES];

    }else if(self.conversationType == ConversationType_DISCUSSION){
        
        RCDDiscussGroupSettingViewController *settingVC = [[RCDDiscussGroupSettingViewController alloc] init];
        settingVC.conversationType = self.conversationType;
        settingVC.targetId = self.targetId;
        settingVC.conversationTitle = self.targetName;
        //设置讨论组标题时，改变当前聊天界面的标题
        settingVC.setDiscussTitleCompletion = ^(NSString *discussTitle){
            self.title = discussTitle;
        };
        //清除聊天记录之后reload data
        __weak RCDChatViewController *weakSelf = self;
        settingVC.clearHistoryCompletion = ^(BOOL isSuccess)
        {
            if (isSuccess) {
                [weakSelf.conversationDataRepository removeAllObjects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.conversationMessageCollectionView reloadData];
                });
            }
        };


        [self.navigationController pushViewController:settingVC animated:YES];
    }
    
//聊天室设置
    else if(self.conversationType == ConversationType_CHATROOM){
        RCDRoomSettingViewController *settingVC = [[RCDRoomSettingViewController alloc] init];
        settingVC.conversationType = self.conversationType;
        settingVC.targetId = self.targetId;
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    
//群组设置
    else if(self.conversationType == ConversationType_GROUP){
        RCSettingViewController *settingVC = [[RCSettingViewController alloc] init];
        settingVC.conversationType = self.conversationType;
        settingVC.targetId = self.targetId;
        [self.navigationController pushViewController:settingVC animated:YES];
    }
//客服设置
    else if(self.conversationType == ConversationType_CUSTOMERSERVICE){
        RCSettingViewController *settingVC = [[RCSettingViewController alloc] init];
        settingVC.conversationType = self.conversationType;
        settingVC.targetId = self.targetId;
        //清除聊天记录之后reload data
        __weak RCDChatViewController *weakSelf = self;
        settingVC.clearHistoryCompletion = ^(BOOL isSuccess)
        {
            if (isSuccess) {
                [weakSelf.conversationDataRepository removeAllObjects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.conversationMessageCollectionView reloadData];
                });
            }
        };
        [self.navigationController pushViewController:settingVC animated:YES];
    }
    
}


/**
 *  更新左上角未读消息数
 */
-(void)notifyUpdateUnReadMessageCount
{
    __weak typeof(&*self) __weakself = self;
    int count = [[RCIMClient sharedClient]getUnreadCount: @[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION), @(ConversationType_APPSERVICE), @(ConversationType_PUBLICSERVICE),@(ConversationType_GROUP)]];
    dispatch_async(dispatch_get_main_queue(), ^{
        if (count > 0) {
            [__weakself.navigationItem.leftBarButtonItem setTitle:[NSString stringWithFormat:@"返回(%d)",count]];
        }else
        {
            [__weakself.navigationItem.leftBarButtonItem setTitle:@"返回"];
        }
    });
}

@end
