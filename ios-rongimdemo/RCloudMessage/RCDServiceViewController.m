//
//  RCDServiceViewController.m
//  RCloudMessage
//
//  Created by Liv on 14/12/1.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import "RCDServiceViewController.h"
//#import "RCChatViewController.h"
#import <RongIMKit/RongIMKit.h>
//#import "RCHandShakeMessage.h"
#import "RCDChatViewController.h"

@interface RCDServiceViewController ()

@end

@implementation RCDServiceViewController



- (IBAction)acService:(UIButton *)sender {

#define SERVICE_ID @"kefu114"
    RCDChatViewController *chatService = [[RCDChatViewController alloc] init];
    chatService.targetName = @"客服";
    chatService.targetId = SERVICE_ID;
    chatService.conversationType = ConversationType_CUSTOMERSERVICE;
    chatService.title = chatService.targetName;

//    RCHandShakeMessage* textMsg = [[RCHandShakeMessage alloc] init];
//    [[RongUIKit sharedKit] sendMessage:ConversationType_CUSTOMERSERVICE targetId:SERVICE_ID content:textMsg delegate:nil];
    [self.navigationController showViewController:chatService sender:nil];

    

}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //设置为不用默认渲染方式
        self.tabBarItem.image = [[UIImage imageNamed:@"icon_server"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_server_hover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"客服";
    self.tabBarController.navigationItem.rightBarButtonItem = nil;

}
- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
