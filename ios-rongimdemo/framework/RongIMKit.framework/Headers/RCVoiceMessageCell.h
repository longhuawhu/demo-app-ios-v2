//
//  RCVoiceMessageCell.h
//  RongIMKit
//
//  Created by xugang on 15/2/2.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageCell.h"
#define kAudioBubbleMinWidth 60
#define kAudioBubbleMaxWidth 180
#define kBubbleBackgroundViewHeight 36

UIKIT_EXTERN NSString *const kNotificationStopVoicePlayer;

@interface RCVoiceMessageCell : RCMessageCell

@property (nonatomic, strong) UIImageView   *bubbleBackgroundView;
@property (nonatomic, strong) UIImageView   *playVoiceView;
@property (nonatomic,strong) UIImageView    *voiceUnreadTagView;
@property (nonatomic, strong) UILabel     *voiceDurationLabel;

@end
