//
//  RCDGroupDetailViewController.m
//  RCloudMessage
//
//  Created by 杜立召 on 15/3/21.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import "RCDGroupDetailViewController.h"
#import "RCDGroupInfo.h"
#import "RCDHttpTool.h"
#import "RCDRCIMDataSource.h"

@interface RCDGroupDetailViewController ()<UIActionSheetDelegate>

@end

@implementation RCDGroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lbGroupName.text=_groupInfo.groupName;
    _lbGroupIntru.text=_groupInfo.introduce;
    
    _lbNumberInGroup.text=[NSString stringWithFormat:@"%@/%@",_groupInfo.number,_groupInfo.maxNumber];
    
    if (_groupInfo.isJoin) {
        UIImage *image = [UIImage imageNamed:@"group_quit"];
        image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
        [_btJoinOrQuitGroup setTitle:@"删除并退出" forState:UIControlStateNormal];
        [_btJoinOrQuitGroup setBackgroundImage:image forState:UIControlStateNormal];
    }else
    {
        UIImage *image = [UIImage imageNamed:@"group_add"];
        image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
        [_btJoinOrQuitGroup setTitle:@"加入" forState:UIControlStateNormal];
        [_btJoinOrQuitGroup setBackgroundImage:image forState:UIControlStateNormal];
    }


    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)joinOrQuitGroup:(id)sender {
    int groupId=[_groupInfo.groupId intValue];
    if(!_groupInfo.isJoin)
    {
        
        [RCDHTTPTOOL joinGroup:groupId complete:^(BOOL isOk)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
             if (isOk) {
                 _groupInfo.isJoin=YES;
                 UIImage *image = [UIImage imageNamed:@"group_quit"];
                 image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
                 [_btJoinOrQuitGroup setTitle:@"删除并退出" forState:UIControlStateNormal];

                 [_btJoinOrQuitGroup setBackgroundImage:image forState:UIControlStateNormal];             }else{
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                     message:@"加入失败！" delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil, nil];
                 [alertView show];
                
                [RCDDataSource syncGroups];

             }
             });
             
         }];
    }else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"确定退出群组？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil];
        [actionSheet showInView:self.view];
    }

}

#pragma mark-UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    int groupId=[_groupInfo.groupId intValue];
    if (buttonIndex==0) {
        [RCDHTTPTOOL quitGroup:groupId complete:^(BOOL isOk)
         {
             dispatch_async(dispatch_get_main_queue(), ^{
             if (isOk) {
                 _groupInfo.isJoin=NO;
                 UIImage *image = [UIImage imageNamed:@"group_add"];
                 image = [image stretchableImageWithLeftCapWidth:floorf(image.size.width/2) topCapHeight:floorf(image.size.height/2)];
                 [_btJoinOrQuitGroup setTitle:@"加入" forState:UIControlStateNormal];
                 [_btJoinOrQuitGroup setBackgroundImage:image forState:UIControlStateNormal];
                 [RCDDataSource syncGroups];

                 
             }else{
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                                     message:@"退出失败！" delegate:nil
                                                           cancelButtonTitle:@"确定"
                                                           otherButtonTitles:nil, nil];
                 [alertView show];
             }
             });
         }];

    }
    

}

@end
