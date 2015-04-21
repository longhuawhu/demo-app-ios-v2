//
//  RCDAddFriendViewController.m
//  RCloudMessage
//
//  Created by Liv on 15/4/16.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import "RCDAddFriendViewController.h"
#import "RCDHttpTool.h"
#import "UIImageView+WebCache.h"
@interface RCDAddFriendViewController ()

@end

@implementation RCDAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.ivAva.clipsToBounds = YES;
    self.ivAva.layer.cornerRadius = 8.f;
    
    self.lblName.text = self.targetUserInfo.name;
    [self.ivAva sd_setImageWithURL:[NSURL URLWithString:self.targetUserInfo.portraitUri] placeholderImage:[UIImage imageNamed:@"icon_1"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)actionAddFriend:(id)sender {
    [RCDHTTPTOOL requestFriend:_targetUserInfo.userId complete:^(BOOL result) {
        if (result) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请求已发送" delegate:nil
                                                      cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
