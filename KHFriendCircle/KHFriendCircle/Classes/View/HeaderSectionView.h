//
//  HeaderSectionView.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsModel.h"

@interface HeaderSectionView : UITableViewHeaderFooterView

@property(nonatomic,strong) ItemsModel * itemsModel;
@property(nonatomic,weak) UIImageView*iconView;
@property(nonatomic,weak) UILabel*nameLabel;
@property(nonatomic,weak) UILabel*timeLabel;
@property(nonatomic,weak) UILabel*contentLabel;
@property(nonatomic,weak) UIView*botttomLine;
@property(nonatomic,weak) UIView*photoView;
@end
