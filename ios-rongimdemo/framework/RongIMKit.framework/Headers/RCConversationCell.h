//
//  RCConversationTableCell.h
//  RongIMKit
//
//  Created by xugang on 15/1/24.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#ifndef __RCConversationTableCell
#define __RCConversationTableCell
#import <UIKit/UIKit.h>
#import "RCConversationBaseCell.h"

#import "RCMessageBubbleTipView.h"
#import "RCThemeDefine.h"

#define CONVERSATION_ITEM_HEIGHT 65.0f
@protocol RCConversationCellDelegate;
@class RCloudImageView;
@interface RCConversationCell : RCConversationBaseCell

@property (weak ,nonatomic) id<RCConversationCellDelegate> delegate;
@property (strong, nonatomic) UIView *headerImageViewBackgroundView;
@property (strong, nonatomic) RCloudImageView *headerImageView;
@property (strong, nonatomic) UILabel * convesationTitle;
@property (strong, nonatomic) UILabel * messageContentLabel;
@property (strong, nonatomic) UILabel *messageCreatedTimeLabel;
@property (strong, nonatomic) RCMessageBubbleTipView* bubbleTipView;
@property (strong, nonatomic) UIImageView *conversationStatusImageView;

@property (nonatomic) RCUserAvatarStyle portraitStyle;
@property (nonatomic) BOOL isNotify;


-(void)setHeaderImagePortraitStyle:(RCUserAvatarStyle)portraitStyle;
-(void)setDataModel:(RCConversationModel*)model;

@end


@protocol RCConversationCellDelegate <NSObject>

//点击头像
-(void)didTapCellPortrait:(NSString*)userId;

@end

#endif