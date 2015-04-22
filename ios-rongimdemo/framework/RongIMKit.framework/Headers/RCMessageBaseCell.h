//
//  RCMessageBaseCell.h
//  RongIMKit
//
//  Created by xugang on 15/1/28.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#ifndef __RCMessageBaseCell
#define __RCMessageBaseCell

#import <UIKit/UIKit.h>
#import <RongIMLib/RongIMLib.h>
#import "RCMessageModel.h"
#import "RCMessageCellNotificationModel.h"

//
UIKIT_EXTERN NSString *const KNotificationMessageBaseCellUpdateSendingStatus;

#define TIME_LABEL_HEIGHT 20

@class RCCollectionCellAttributes;
@class RCTipLabel;

@interface RCMessageBaseCell : UICollectionViewCell

/**
 *   显示时间的Label
 */
@property (strong ,nonatomic) RCTipLabel         *msgtimeLabel;
@property (strong ,nonatomic) RCMessageModel     *model;
@property (strong ,nonatomic) UIView *baseContentView;
@property (nonatomic) RCMessageDirection messageDirection;
@property (nonatomic,readonly) BOOL               isDisplayMessageTime;




- (instancetype)initWithFrame:(CGRect)frame;

- (void)setDataModel:(RCMessageModel *)model;

- (void) messageCellUpdateSendingStatusEvent:(NSNotification*)notification;
@end

#endif