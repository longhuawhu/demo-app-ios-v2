//
//  RCDChatListCell.h
//  RCloudMessage
//
//  Created by Liv on 15/4/15.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>

@interface RCDChatListCell : RCConversationBaseCell

@property (nonatomic,strong) UIImageView *ivAva;
@property (nonatomic,strong) UILabel *lblName;
@property (nonatomic,strong) UILabel *lblDetail;
@property (nonatomic, copy) NSString *userName;

@end
