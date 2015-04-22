//
//  RCConversationSettingTableViewController.h
//  RongIMKit
//
//  Created by Liv on 15/4/20.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <RongIMLib/RongIMLib.h>

@class RCConversationSettingTableViewHeader;

@interface RCConversationSettingTableViewController : UITableViewController

//内置置顶聊天，新消息通知，清除消息记录三个cell
@property (nonatomic,strong,readonly) NSArray *defaultCells;

//是否隐藏顶部视图
@property (nonatomic,assign) BOOL headerHidden;

@property (nonatomic,assign) BOOL switch_isTop;
@property (nonatomic,assign) BOOL switch_newMessageNotify;

//设置顶部视图显示的users
@property (nonatomic,strong) NSArray *users;

- (void) disableDeleteMemberEvent:(BOOL)disable;

/**
 *  重写以下方法，自定义点击事件
 *
 */

//置顶聊天
-(void) onClickIsTopSwitch:(id) sender;

//新消息通知
-(void) onClickNewMessageNotificationSwitch:(id) sender;

//清除聊天记录
-(void) onClickClearMessageHistory:(id) sender;

//添加users到顶部视图
-(void) addUsers:(NSArray *)users;

//重写以下两个方法以实现顶部视图item点击事件
-(void)settingTableViewHeader:(RCConversationSettingTableViewHeader *)settingTableViewHeader indexPathOfSelectedItem:(NSIndexPath *)indexPathOfSelectedItem
           allTheSeletedUsers:(NSArray *)users;

-(void)deleteTipButtonClicked:(NSIndexPath *)indexPath;

@end
