//
//  RCPublicServiceMultiRichContentMessage.h
//  RongIMLib
//
//  Created by litao on 15/4/13.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageContent.h"
#define RCPublicServiceRichContentTypeIdentifier             @"RC:PSMultiImgTxtMsg"

@interface RCPublicServiceMultiRichContentMessage : RCMessageContent
/**
 *  消息内容 
 *  类型是RCRichContentMessage
 */
@property (nonatomic, strong)NSMutableArray *richConents; //array of RCRichContentMessage
/**
 *  附加信息
 */
@property(nonatomic, strong) NSString* extra;
@end
