//
//  RCTextMessageCell.h
//  RongIMKit
//
//  Created by xugang on 15/2/2.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageCell.h"
#import "RCAttributedLabel.h"

#define Text_Message_Font_Size 16

@interface RCTextMessageCell : RCMessageCell

@property (strong ,nonatomic) RCAttributedLabel *textLabel;
@property (nonatomic, strong) UIImageView       *bubbleBackgroundView;

- (void)setDataModel:(RCMessageModel *)model;
@end
