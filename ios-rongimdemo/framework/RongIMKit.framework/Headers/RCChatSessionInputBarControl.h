//
//  RCChatSessionInputBarControl.h
//  RongIMKit
//
//  Created by xugang on 15/2/12.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//






#ifndef __RCChatSessionInputBarControl
#define __RCChatSessionInputBarControl
#import <UIKit/UIKit.h>
#import <RongIMLib/RongIMLib.h>
#import "RCTextView.h"
#define Height_ChatSessionInputBar 48.0f

typedef NS_ENUM(NSInteger, RCChatSessionInputBarControlStyle)
{
    
    RCChatSessionInputBarControlStyle1 = 0,  //switch-input-extend
    
    RCChatSessionInputBarControlStyle2 = 1, //extend-input-switch
    RCChatSessionInputBarControlStyle3 = 2, //input-switch-extend
    RCChatSessionInputBarControlStyle4 = 3, //input-extend-switch
    RCChatSessionInputBarControlStyle5 = 4, //switch-input
    RCChatSessionInputBarControlStyle6 = 5, //input-switch
    RCChatSessionInputBarControlStyle7 = 6, //extend-input
    RCChatSessionInputBarControlStyle8 = 7, //input-extend
    RCChatSessionInputBarControlStyle9 = 8, //input
};

typedef NS_ENUM(NSInteger, RCChatSessionInputBarControlType) {
    /**
     *  默认类型
     */
    RCChatSessionInputBarControlDefaultType = 0,
    /**
     *  默认公众账号类型
     */
    RCChatSessionInputBarControlPubType = 1
};

@protocol RCChatSessionInputBarControlDelegate;

@interface RCChatSessionInputBarControl : UIView


@property (weak ,nonatomic) id<RCChatSessionInputBarControlDelegate> delegate;
@property (weak, nonatomic)UIView *clientView;

@property (strong ,nonatomic) UIButton *pubSwitchButton;
@property (strong ,nonatomic) UIView *inputContainerView;
@property (strong ,nonatomic) UIView *menuContainerView;

@property (strong ,nonatomic) UIButton *switchButton;
@property (strong ,nonatomic) UIButton *recordButton;
@property (strong ,nonatomic) RCTextView *inputTextView;
@property (strong ,nonatomic) UIButton *emojiButton;
@property (strong ,nonatomic) UIButton *additionalButton;
@property (assign ,nonatomic, readonly) UIView *contextView;

@property (assign, nonatomic) float currentPositionY;
@property (assign ,nonatomic) float originalPositionY;
@property (assign, nonatomic) float inputTextview_height;

@property (strong, nonatomic) RCPublicServiceMenu *pubMenu;

-(id)initWithFrame:(CGRect)frame
   withContextView:(UIView *) contextView
              type:(RCChatSessionInputBarControlType)type
             style:(RCChatSessionInputBarControlStyle)style;

/**
 *  设置输入栏的样式 可以在viewdidload后，可以设置样式
 *
 *  @param style 样式
 */
-(void)setInputBarType:(RCChatSessionInputBarControlType)type
                 style:(RCChatSessionInputBarControlStyle)style;

@end

@protocol RCChatSessionInputBarControlDelegate <NSObject>

@optional
- (void) keyboardWillShowWithFrame:(CGRect)keyboardFrame;
- (void) keyboardWillHide;
- (void) chatSessionInputBarControlContentSizeChanged:(CGRect)frame;
- (void) didTouchKeyboardReturnKey:(RCChatSessionInputBarControl*)inputControl text:(NSString*)text;
- (void) didTouchEmojiButton:(UIButton*)sender;
- (void) didTouchAddtionalButton:(UIButton*)sender;
- (void) didTouchSwitchButton:(BOOL)switched;
- (void) didTouchPubSwitchButton:(BOOL)switched;
/**
 *  点击录音按钮
 *
 *  @param sender 录音按钮
 *  @param event  事件
 */
-(void)didTouchRecordButon:(UIButton*)sender event:(UIControlEvents)event;
@end

#endif