//
//  RCDGroupDetailViewController.h
//  RCloudMessage
//
//  Created by 杜立召 on 15/3/21.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RCDGroupInfo.h"

#define  EditNickNameInGroup @"EditNickNameInGroup"
#define  EditGroupIntroduce @"EditGroupIntroduce"
#define  EditGroupName @"EditGroupName"

@interface RCDGroupDetailViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tbGroupInfo;
@property (strong, nonatomic)  RCDGroupInfo *groupInfo;
@property (weak, nonatomic) IBOutlet UILabel *lbGroupName;
@property (weak, nonatomic) IBOutlet UIImageView *imgGroupPortait;
@property (weak, nonatomic) IBOutlet UILabel *lbGroupIntru;
@property (weak, nonatomic) IBOutlet UILabel *lbGroupNotice;
@property (weak, nonatomic) IBOutlet UILabel *lbMyNickNameInGroup;
@property (weak, nonatomic) IBOutlet UILabel *lbNumberInGroup;

@property (weak, nonatomic) IBOutlet UIButton *btJoinOrQuitGroup;
- (IBAction)joinOrQuitGroup:(id)sender;

@end
