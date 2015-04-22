//
//  RCPublicServiceMultiRichContentMessage.h
//  RongIMLib
//
//  Created by litao on 15/4/15.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>
#import "RCRichContentItem.h"
#define RCSingleNewsMessageTypeIdentifier      @"RC:PSImgTxtMsg"

@interface RCPublicServiceRichContentMessage : RCRichContentMessage

/**
 *  消息内容
 *  类型是RCRichContentItem
 */
@property (nonatomic, strong)RCRichContentItem *richConent;
/**
 *  附加信息
 */
@property(nonatomic, strong) NSString* extra;
@end
