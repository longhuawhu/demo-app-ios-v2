//
//  RCDPersonDetailViewController.m
//  RCloudMessage
//
//  Created by Liv on 15/4/9.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import "RCDPersonDetailViewController.h"
#import "RCDChatViewController.h"
#import <RongIMKit/RongIMKit.h>
#import <RongIMLib/RCUserInfo.h>
#import "RCDHttpTool.h"
#import "UIImageView+WebCache.h"

@interface RCDPersonDetailViewController ()<UIActionSheetDelegate>


@end

@implementation RCDPersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(rightBarButtonItemClicked:)];

    self.lblName.text = self.userInfo.name;
    self.ivAva.clipsToBounds = YES;
    self.ivAva.layer.cornerRadius = 8.f;
    [self.ivAva sd_setImageWithURL:[NSURL URLWithString:self.userInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"icon_1"]];


    
}
- (IBAction)btnConversation:(id)sender {
    //创建会话
    RCDChatViewController *chatViewController = [[RCDChatViewController alloc] init];
    chatViewController.conversationType = ConversationType_PRIVATE;
    chatViewController.targetId = self.userInfo.userId;
    chatViewController.title = self.userInfo.name;
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)btnVoIP:(id)sender {
    //语音通话
    [[RCIM sharedKit] startVoIPCallWithTargetId:self.userInfo.userId];
}


-(void) rightBarButtonItemClicked:(id) sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"解除好友关系", @"加入黑名单", nil];
    [actionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIActionSheet Delegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            //解除好友关系
            [RCDHTTPTOOL deleteFriend:self.userInfo.userId complete:^(BOOL result) {
               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"删除好友成功！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil
                , nil];
                [alertView show];
            }];

        }
            break;
        case 1:
        {
            //黑名单

        }
            break;
    }
}

@end
