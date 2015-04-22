//
//  RCTipMessageCell.h
//  RongIMKit
//
//  Created by xugang on 15/1/29.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageBaseCell.h"

@interface RCTipMessageCell : RCMessageBaseCell

@property (strong ,nonatomic) RCTipLabel *tipMessageLabel;

- (void)setDataModel:(RCMessageModel *)model;

@end
