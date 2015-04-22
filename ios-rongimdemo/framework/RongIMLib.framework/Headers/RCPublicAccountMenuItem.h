//
//  RCPublicAccountMenuItem.h
//  RongIMLib
//
//  Created by litao on 15/4/14.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCPublicAccountMenuItem : NSObject
@property (nonatomic, strong)NSString *text;
@property (nonatomic, strong)NSString *url;
+ (instancetype)menuItemFromJsonDic:(NSDictionary *)jsonDic;
@end
