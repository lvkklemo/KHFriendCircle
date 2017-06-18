//
//  CommentCell.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsModel.h"

@interface CommentCell : UITableViewCell

@property(nonatomic,weak)UILabel * commentLabel;
@property(nonatomic,strong) CommentModel * comment;
@end
