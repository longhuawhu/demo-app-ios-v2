//
//  RCPublicServiceMenuGroup.h
//  RongIMLib
//
//  Created by litao on 15/4/14.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RCPublicServiceMenuGroup : NSObject
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSArray *menuGroups; //of RCPublicServiceMenuItem
+ (instancetype)menuGroupFromJsonDic:(NSDictionary *)jsonDic;
@end
