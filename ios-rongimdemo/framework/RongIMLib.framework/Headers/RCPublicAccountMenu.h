//
//  RCPublicAccountMenu.h
//  RongIMLib
//
//  Created by litao on 15/4/14.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//


/* Menu -> MenuGroup -> MenuItem
 *                   -> MenuItem
 *
 *         MenuGroup -> MenuItem
 *                   -> MenuItem
 *                   -> MenuItem
 */
#import <Foundation/Foundation.h>
#import "RCPublicAccountMenuGroup.h"
#import "RCPublicAccountMenuItem.h"

@interface RCPublicAccountMenu : NSObject
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSArray *menuGroups; //of RCPublicAccountMenuGroup
- (void)decodeWithData:(NSData *)data;
@end
