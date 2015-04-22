//
//  RCMessageCellDelegate.h
//  RongIMKit
//
//  Created by xugang on 3/14/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#ifndef RongIMKit_RCMessageCellDelegate_h
#define RongIMKit_RCMessageCellDelegate_h

@protocol RCMessageCellDelegate <NSObject>

@optional;
/**
 *  点击消息内容
 *
 *  @param model 数据
 */
- (void) didTapMessageCell:(RCMessageModel *)model;

/**
 *  点击头像事件
 *
 *  @param userId 用户的ID
 */
- (void) didTapCellPortrait:(NSString*)userId;

/**
 *  长按消息内容
 *
 *  @param model 数据
 */
- (void) didLongTouchMessageCell:(RCMessageModel*)model inView:(UIView*)view;


/**
 *  for resending message
 */
- (void) didTapmsgFailedStatusViewForResend:(RCMessageModel *)model;
@end

#endif
