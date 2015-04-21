//
//  RCDRoomSettingViewController.m
//  RCloudMessage
//
//  Created by Liv on 15/4/8.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import "RCDRoomSettingViewController.h"

@implementation RCDRoomSettingViewController


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.defaultCells.count - 1 ;
}

@end
