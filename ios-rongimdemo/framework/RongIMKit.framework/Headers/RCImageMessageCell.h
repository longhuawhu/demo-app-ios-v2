//
//  RCImageMessageCell.h
//  RongIMKit
//
//  Created by xugang on 15/2/2.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageCell.h"
#import "RCImageMsgProgressView.h"

@interface RCImageMessageCell : RCMessageCell

@property (nonatomic,strong)  UIImageView *pictureView;
@property (nonatomic,strong)  RCImageMsgProgressView * progressView;

@end
