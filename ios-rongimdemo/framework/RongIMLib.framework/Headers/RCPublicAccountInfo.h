//
//  RCPublicAccountInfo.h
//  HelloIos
//
//  Created by litao on 15/4/9.
//  Copyright (c) 2015年 litao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "RCStatusDefine.h"
#import "RCPublicAccountMenu.h"

@interface RCPublicAccountInfo : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *descriptions;
@property (nonatomic, strong)NSString *userID;
@property (nonatomic, strong)NSString *thumbnailUrl;
@property (nonatomic, strong)NSString *owner;
@property (nonatomic, strong)NSString *ownerUrl;
@property (nonatomic, strong)NSString *serviceTel;
@property (nonatomic, strong)NSString *histroyMsgUrl;
@property (nonatomic, strong)CLLocation *location;
@property (nonatomic, strong)NSString *scope;  //business scope
@property (nonatomic)RCConversationType type;
@property (nonatomic)BOOL followed;
@property (nonatomic, strong)NSString *extra;
@property (nonatomic, strong)RCPublicAccountMenu *menu;
@property (nonatomic, getter=isGlobal)BOOL global;

/**
 *  公众账号的json数据
 */
@property(nonatomic, strong) NSDictionary *jsonDict;
- (void)initContent:(NSString *)jsonContent;
@end
