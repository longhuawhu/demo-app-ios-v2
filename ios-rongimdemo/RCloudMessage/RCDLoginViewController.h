//
//  LoginViewController.h
//  RongCloud
//
//  Created by Liv on 14/11/5.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RCAnimatedImagesView.h"
@interface RCDLoginViewController : UIViewController<RCAnimatedImagesViewDelegate>

//-(void) defaultLogin;
- (void)login:(NSString *)userName password:(NSString *)password;
@end
