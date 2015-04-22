//
//  RCNumberProgressView.h
//  RCIM
//
//  Created by xugang on 6/5/14.
//  Copyright (c) 2014 Heq.Shinoda. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  RCImageMsgProgressView
 */
@interface RCImageMsgProgressView : UIView

//@property (nonatomic,assign) NSInteger progress;
@property (nonatomic,assign) UILabel *label;
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;
/**
 *  updateProgress
 *
 *  @param progress persent
 */
-(void)updateProgress:(NSInteger)progress;
/**
 *  startActive
 */
-(void)startActive;
/**
 *  stopActive
 */
-(void)stopActive;
@end
