//
//  RCPluginBoard.h
//  CollectionViewTest
//
//  Created by Liv on 15/3/15.
//  Copyright (c) 2015年 胡利武. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RCPluginBoardViewDelegate;

@interface RCPluginBoardView : UICollectionView

@property (nonatomic,strong) NSMutableArray *allItems;
@property (nonatomic,weak) id<RCPluginBoardViewDelegate> pluginBoardDelegate;


/**
 *  添加扩展项，在会话中，可以在viewdidload后，向RCPluginBoardView添加功能项
 *
 *  @param image 图片
 *  @param title 标题
 *  @param index 索引
 */
-(void)insertItemWithImage:(UIImage*)image title:(NSString*)title atIndex:(NSInteger)index;


@end

@protocol RCPluginBoardViewDelegate <NSObject>
/**
 *  点击事件
 *
 *  @param pluginBoardView 功能模板
 *  @param index           索引
 */
-(void)pluginBoardView:(RCPluginBoardView*)pluginBoardView clickedItemAtIndex:(NSInteger)index;

@end
