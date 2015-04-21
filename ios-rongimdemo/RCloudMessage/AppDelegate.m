//
//  AppDelegate.m
//  RongCloud
//
//  Created by Liv on 14/10/31.
//  Copyright (c) 2014年 胡利武. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import "AppDelegate.h"
#import "RCDLoginViewController.h"
#import "RCDRCIMDataSource.h"
#import "RCDLoginInfo.h"
#import <AudioToolbox/AudioToolbox.h>
#import "MobClick.h"
#import "UIImageView+WebCache.h"
#import "MBProgressHUD.h"


//#define RONGCLOUD_IM_APPKEY @"e0x9wycfx7flq" //offline key
#define RONGCLOUD_IM_APPKEY @"z3v5yqkbv8v30" //online key

#define UMENG_APPKEY @"551ce859fd98c57cdf000678"
#define kDeviceToken @"RongCloud_SDK_DeviceToken"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化友盟配置
    [self umengTrack];
    
    NSString *_deviceTokenCache = [[NSUserDefaults standardUserDefaults]objectForKey:kDeviceToken];
    
    //初始化融云SDK
    [[RCIM sharedKit] initWithAppKey:RONGCLOUD_IM_APPKEY deviceToken:_deviceTokenCache];
    //设置会话列表头像和会话界面头像
    [RCIM sharedKit].globalConversationPortraitSize = CGSizeMake(56, 56);
    [RCIM sharedKit].globalMessagePortraitSize = CGSizeMake(40, 40);
    
    //登录
    RCDLoginViewController *loginVC = [[RCDLoginViewController alloc] init];
   // [loginVC defaultLogin];
   // RCDLoginViewController* loginVC = [storyboard instantiateViewControllerWithIdentifier:@"loginVC"];
    UINavigationController *_navi = [[UINavigationController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = _navi;
    
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge
                                                                                             |UIRemoteNotificationTypeSound
                                                                                             |UIRemoteNotificationTypeAlert) categories:nil];
        [application registerUserNotificationSettings:settings];
    }else{
        
        //注册推送, iOS 8
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil];
        [application registerUserNotificationSettings:settings];
    }

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];


    return YES;
}

//注册用户通知设置
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [[[[deviceToken description]
               stringByReplacingOccurrencesOfString:@"<" withString:@""]
              stringByReplacingOccurrencesOfString:@">" withString:@""]
             stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:kDeviceToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[RCIMClient sharedClient] setDeviceToken:token];
}

- (void)umengTrack {
    
    //    [MobClick setCrashReportEnabled:NO]; // 如果不需要捕捉异常，注释掉此行
    // 打开友盟sdk调试，注意Release发布时需要注释掉此行,减少io消耗
    [MobClick setLogEnabled:YES];
   
    //参数为NSString * 类型,自定义app版本信息，如果不设置，默认从CFBundleVersion里取
    [MobClick setAppVersion:XcodeAppVersion];
    
    //   reportPolicy为枚举类型,可以为 REALTIME, BATCH,SENDDAILY,SENDWIFIONLY几种
    //   channelId 为NSString * 类型，channelId 为nil或@""时,默认会被被当作@"App Store"渠道
    [MobClick startWithAppkey:UMENG_APPKEY reportPolicy:(ReportPolicy) REALTIME channelId:nil];
    
    
    //      [MobClick checkUpdate];   //自动更新检查, 如果需要自定义更新请使用下面的方法,需要接收一个(NSDictionary *)appInfo的参数
    //    [MobClick checkUpdateWithDelegate:self selector:@selector(updateMethod:)];
    
    //在线参数配置
    [MobClick updateOnlineConfig];
    
}

- (void)onlineConfigCallBack:(NSNotification *)note {
    
    NSLog(@"online config has fininshed and note = %@", note.userInfo);
}


-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSound(1007);
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    int unreadMsgCount = [[RCIMClient sharedClient]getUnreadCount: @[@(ConversationType_PRIVATE),@(ConversationType_DISCUSSION), @(ConversationType_PUBLICSERVICE), @(ConversationType_PUBLICSERVICE),@(ConversationType_GROUP)]];
    application.applicationIconBadgeNumber = unreadMsgCount;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
