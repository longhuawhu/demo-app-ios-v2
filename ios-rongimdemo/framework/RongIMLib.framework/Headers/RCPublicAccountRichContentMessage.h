//
//  RCPublicAccountRichContentMessage.h
//  RongIMLib
//
//  Created by litao on 15/4/13.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import "RCMessageContent.h"
#define RCPublicAccountRichContentTypeIdentifier             @"RC:NewsMsg"

@interface RCPublicAccountRichContentMessage : RCMessageContent
/**
 *  消息内容 
 *  类型是RCRichContentMessage
 */
@property (nonatomic, strong)NSMutableArray *richConents; //array of RCRichContentMessage
/**
 *  Push消息内容
 */
@property(nonatomic, strong) NSString* pushContent;
/**
 *  附加信息
 */
@property(nonatomic, strong) NSString* extra;
@end
