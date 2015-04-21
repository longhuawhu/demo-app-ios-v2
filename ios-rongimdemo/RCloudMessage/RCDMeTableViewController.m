//
//  RCDMeTableViewController.m
//  RCloudMessage
//
//  Created by Liv on 14/11/28.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import "RCDMeTableViewController.h"
#import "UIColor+RCColor.h"
#import <RongIMLib/RongIMLib.h>
#import "RCDChatViewController.h"

@interface RCDMeTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *currentUserNameLabel;

@end

@implementation RCDMeTableViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //设置为不用默认渲染方式
        self.tabBarItem.image = [[UIImage imageNamed:@"icon_me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_me_hover"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    //设置分割线颜色
    self.tableView.separatorColor = [UIColor colorWithHexString:@"dfdfdf" alpha:1.0f];
    self.currentUserNameLabel.text = [RCIMClient sharedClient].currentUserInfo.name;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"我";
    self.tabBarController.navigationItem.rightBarButtonItem = nil;
    self.tabBarController.navigationController.navigationBar.tintColor = [UIColor whiteColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2 && indexPath.row == 0) {
#define SERVICE_ID @"kefu114"
        RCDChatViewController *chatService = [[RCDChatViewController alloc] init];
        chatService.targetName = @"客服";
        chatService.targetId = SERVICE_ID;
        chatService.conversationType = ConversationType_CUSTOMERSERVICE;
        chatService.title = chatService.targetName;
        [self.navigationController pushViewController:chatService animated:YES];
    }
}

@end
