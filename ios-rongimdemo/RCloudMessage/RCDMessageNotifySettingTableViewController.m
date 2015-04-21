//
//  RCDMessageNotifyTableViewController.m
//  RCloudMessage
//
//  Created by Liv on 14/11/20.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import "RCDMessageNotifySettingTableViewController.h"

@interface RCDMessageNotifySettingTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblNotify;

@end

@implementation RCDMessageNotifySettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //通知开启状态
    UIUserNotificationType userNotiType = [[UIApplication sharedApplication] currentUserNotificationSettings].types;
    if (userNotiType != UIUserNotificationTypeNone) {
        self.lblNotify.text = @"已开启";
    }else{
        self.lblNotify.text = @"未开启";

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
