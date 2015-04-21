//
//  RCDAddFriendViewController.h
//  RCloudMessage
//
//  Created by Liv on 15/4/16.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RongIMLib/RCUserInfo.h>

@interface RCDAddFriendViewController : UITableViewController

@property (nonatomic,strong) RCUserInfo *targetUserInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *ivAva;

@end
