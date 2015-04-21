//
//  RCDRCIMDelegateImplementation.m
//  RongCloud
//
//  Created by Liv on 14/11/11.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import <RongIMLib/RongIMLib.h>
#import "AFHttpTool.h"
#import "RCDRCIMDataSource.h"
#import "RCDLoginInfo.h"
#import "RCDGroupInfo.h"
#import "RCDUserInfo.h"
#import "RCDHttpTool.h"


@interface RCDRCIMDataSource ()

@end

@implementation RCDRCIMDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        //设置信息提供者
        [[RCIM sharedKit] setUserInfoFetcherDelegate:self];
        [[RCIM sharedKit] setGroupInfoFetcherDelegate:self];
        
        //同步群组
        [self syncGroups];
    }
    return self;
}

+ (RCDRCIMDataSource*)shareInstance
{
    static RCDRCIMDataSource* instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];

    });
    return instance;
}

-(void) startServiceWithAppKey:(NSString *) appKey
                     userToken:(NSString *) userToken
{
    //初始化RongCloud SDK
    [[RCIM sharedKit] initWithAppKey:appKey deviceToken:nil];
    
    //登陆RongCloud Server
    [[RCIM sharedKit] connectWithToken:userToken
    
       success:^(NSString *userId) {
           NSAssert(userId, @"connect success!");
      } error:^(RCConnectErrorCode status) {
        
    }];
}


-(void) syncGroups
{
    //开发者调用自己的服务器接口获取所属群组信息，同步给融云服务器，也可以直接
    //客户端创建，然后同步
    [RCDHTTPTOOL getMyGroupsWithBlock:^(NSMutableArray *result) {
        if ([result count]) {
            //同步群组
            [[RCIMClient sharedClient] syncGroups:result
                                         completion:^{
                //DebugLog(@"同步成功!");
            } error:^(RCErrorCode status) {
                //DebugLog(@"同步失败!  %ld",(long)status);
                
            }];
        }
    }];

}

#pragma mark - GroupInfoFetcherDelegate
- (void)getGroupInfoWithGroupId:(NSString*)groupId completion:(void (^)(RCGroup*))completion
{
    if ([groupId length] == 0)
        return completion(nil);
    
    //开发者调自己的服务器接口根据userID异步请求数据
    [RCDHTTPTOOL getGroupByID:groupId
            successCompletion:^(RCGroup *group) {
                completion(group);
    }];
    return completion(nil);
}

#pragma mark - RCIMUserInfoFetcherDelegagte
- (void)getUserInfoWithUserId:(NSString*)userId completion:(void (^)(RCUserInfo*))completion
{
    if ([userId length] == 0)
        return completion(nil);
    
    //开发者调自己的服务器接口根据groupID异步请求数据
    [RCDHTTPTOOL getUserInfoByUserID:userId
                          completion:^(RCUserInfo *user) {
        if (user) {
            completion(user);
        }
    }];
    
    return completion(nil);
}






@end
