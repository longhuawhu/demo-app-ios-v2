//
//  RCDPersonDetailViewController.h
//  RCloudMessage
//
//  Created by Liv on 15/4/9.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <RongIMLib/RCUserInfo.h>

@interface RCDPersonDetailViewController : UITableViewController

//对方ID
@property (nonatomic,strong) RCUserInfo *userInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *ivAva;

@end
