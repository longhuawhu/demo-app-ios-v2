# demo-app-ios-v2
App for demonstration of Rong IMKit v2.0 component.


# iOS SDK 2.0 升级文档

指导用户从 1.0 版本升级到 2.0。

## 项目构建
从项目中移除 SDK1.0 相关类库和资源文件，添加 SDK2.0 相关类库和资源文件。
1，项目中加入 RongIMLib.framework，RongIMKit.framework。
2，在你项目的 Resource 目录中加入 RongCloud.bundle。
3，项目中所有需要 import SDK 中的类地方需要用 #import <包名/类名.h>方式。

## 初始化和登陆相关主要修改
一些接口函数，如：initWithAppKey，
connectWithToken，setUserInfoFetcherWithDelegate，setFriendsFetcherWithDelegate等（参照API文档）改为实例方法
举例：
``` objc
[RCIM initWithAppKey:appKey deviceToken:nil];
```
改为
``` objc
[[RCIM sharedKit] initWithAppKey:appKey deviceToken:nil];
```

## 功能类接口修改

一些在 IMKit 里提供的接口函数，移到了 IMLib 里，请修改使用。

如：getBlacklist\
\setConversationNotificationQuietHours\getConversationNotificationQuietHours()等（参考API文档）

例子：
``` objc
[[RCIM sharedRCIM]removeFromBlacklist:_removedUser.userId completion:^{}];
```
改为
``` objc
[[RCIMClient sharedClient]removeFromBlacklist:_removedUser.userId completion:^{}];
```

## 回调方法修改

优化了部分方法参数类型,返回值由delegate改为block，方便开发者获取返回状态，部分方法由类方法改为了实例方法（参考API文档）。

如：
``` objc
/**
 *  发送消息。
 *
 *  @param targetId         目标 Id。根据不同的 conversationType，可能是聊天 Id、讨论组 Id、群组 Id 或聊天室 Id。
 *  @param conversationType 会话类型。
 *  @param content          消息内容。
 *  @param delegate         发送消息的回调。
 *  @param userData         用户自定义数据，该值会在 delegate 中返回。
 *
 *  @return 发送的消息实体。
 */

-(RCMessage*)sendMessage:(RCConversationType)conversationType targetId:(NSString*)targetId  content:(RCMessageContent*)content delegate:(id<RCSendMessageDelegate>)delegate object:(id)userData;
改为：
/**
 *  发送消息。
 *  @param targetId         目标 Id。根据不同的 conversationType，可能是聊天 Id、讨论组 Id、群组 Id 或聊天室 Id。
 *  @param conversationType 会话类型。
 *  @param content          消息内容。
 *  @param completion       调用完成的处理。
 *  @param error            调用返回的错误信息。
 *
 *  @return 发送的消息实体。
 */
-(RCMessage*)sendMessage:(RCConversationType)conversationType
                targetId:(NSString*)targetId
                 content:(RCMessageContent*)content
             pushContent:(NSString*)pushContent
                 success:(void (^)(long messageId))successBlock
                   error:(void (^)(RCErrorCode nErrorCode, long messageId))errorBlock;
```

## UI类库相关修改（主要修改，其他请见API文档）

会话列表页改为RCConversationListViewController（基于UITableView）
会话页 改为 RCConversationViewController(基于UICollectionView)
图片预览页：RCImagePreviewController

移除部分功能页面：

群组列表页面：RCGroupListViewController
好友选择页面：RCSelectPersonViewController

Base基类方法主要调整：
移除方法：
- (void)setNavigationTitle:(NSString *)title textColor:(UIColor*)textColor;
(void)configureNavigationBar;

移除一些默认创建页面的方法（具体参加API文档）：
如：
createConversationList
launchCustomerServiceChat










