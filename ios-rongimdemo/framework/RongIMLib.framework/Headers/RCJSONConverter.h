//
//  RCJSONConverter.h
//  RongCloud
//
//  Created by Heq.Shinoda on 14-5-15.
//  Copyright (c) 2014年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(JSONCategories)
/**
 *  jsonObject
 */
@property (NS_NONATOMIC_IOSONLY, readonly, strong) id jsonObject;
@end

@interface NSObject (JSONCategories)
/**
 *  jsonString
 */
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSData *jsonString;
@end
/**
 *  JSON转换类
 */
@interface RCJSONConverter : NSObject
/**
 *  字典转换成JSON字符串
 *
 *  @param dictionary dictionary
 *
 *  @return NSString
 */
+(NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;
/**
 *  数组转换成JSON字符串
 *
 *  @param array array
 *
 *  @return NSString
 */
+(NSString *)jsonStringWithArray:(NSArray *)array;
/**
 *  JSON字符串转换成字典
 *
 *  @param string string
 *
 *  @return NSDictionary
 */
+(NSDictionary *)dictionaryWithJSONString:(NSString *)string;
@end


