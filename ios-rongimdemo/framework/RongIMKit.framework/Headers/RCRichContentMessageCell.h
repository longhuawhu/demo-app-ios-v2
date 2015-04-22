//
//  RCRichContentMessageCell.h
//  RongIMKit
//
//  Created by xugang on 15/2/2.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageCell.h"

@class RCAttributedLabel;

#define RichContent_Message_Font_Size 16

@interface RCRichContentMessageCell : RCMessageCell

@property (nonatomic, strong) UIImageView   *bubbleBackgroundView;
@property (nonatomic, strong) RCloudImageView * richContentImageView;
@property (nonatomic, strong) RCAttributedLabel *digestLabel;
@property (nonatomic, strong) RCAttributedLabel *titleLabel;

@end
