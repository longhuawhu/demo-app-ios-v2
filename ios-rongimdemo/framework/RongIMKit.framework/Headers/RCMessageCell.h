//
//  RCMessageCommonCell.h
//  RongIMKit
//
//  Created by xugang on 15/1/28.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#ifndef __RCMessageCommonCell
#define __RCMessageCommonCell
#import "RCMessageBaseCell.h"

#import "RCThemeDefine.h"
#import "RCMessageCellNotificationModel.h"
#import "RCMessageCellDelegate.h"
#import "RCContentView.h"
#define PORTRAIT_WIDTH 45
#define PORTRAIT_HEIGHT 45

@class RCloudImageView;
@interface RCMessageCell : RCMessageBaseCell

@property (nonatomic, weak) id<RCMessageCellDelegate> delegate;

//User header image view.
@property (nonatomic, strong) RCloudImageView *portraitImageView;
//User name label.
@property (nonatomic, strong) UILabel                 *nicknameLabel;

@property (nonatomic, strong) RCContentView *messageContentView;
@property (nonatomic ,strong) UIView *statusContentView;

@property (nonatomic, strong) UIButton                *msgFailedStatusView;
@property (nonatomic, strong) UIActivityIndicatorView *msgActivityIndicatorView;

@property (nonatomic,readonly) CGFloat messageContentViewWidth;

@property (nonatomic, assign, setter = setPortraitStyle:) RCUserAvatarStyle portraitStyle;

//Display nick name for receiver, and hidden for sender.
@property (nonatomic,readonly) BOOL isDisplayNickName;

- (void) setDataModel:(RCMessageModel *)model;

- (void) updateStatusContentView:(RCMessageModel*)model;


@end



#endif