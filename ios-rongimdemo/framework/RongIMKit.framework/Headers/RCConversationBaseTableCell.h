//
//  RCConversationBaseTableCell.h
//  RongIMKit
//
//  Created by xugang on 15/1/24.
//  Copyright (c) 2015年 RongCloud. All rights reserved.
//

#ifndef __RCConversationBaseTableCell
#define __RCConversationBaseTableCell
#import <UIKit/UIKit.h>
#import "RCConversationModel.h"
@interface RCConversationBaseTableCell : UITableViewCell

@property (nonatomic ,strong) RCConversationModel *model;

-(void)setDataModel:(RCConversationModel*)model;
@end

#endif