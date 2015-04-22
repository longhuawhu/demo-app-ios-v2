//
//  RCUnknownMessageCell.h
//  RongIMKit
//
//  Created by xugang on 3/31/15.
//  Copyright (c) 2015 RongCloud. All rights reserved.
//

#ifndef __RCUnknownMessageCell

#define __RCUnknownMessageCell

#import <RongIMKit/RongIMKit.h>

@interface RCUnknownMessageCell : RCMessageBaseCell

@property (strong ,nonatomic) RCTipLabel *messageLabel;

- (void)setDataModel:(RCMessageModel *)model;
@end
#endif