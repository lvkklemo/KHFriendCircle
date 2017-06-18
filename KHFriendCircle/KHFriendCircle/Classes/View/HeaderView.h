//
//  HeaderView.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLLabel.h"
#define TableHeaderHeight 290*([UIScreen mainScreen].bounds.size.width / 375.0)
#define CoverHeight 240*([UIScreen mainScreen].bounds.size.width / 375.0)


#define AvatarSize 70*([UIScreen mainScreen].bounds.size.width / 375.0)
#define AvatarRightMargin 15
#define AvatarPadding 2

#define NickFont [UIFont systemFontOfSize:20]

#define SignFont [UIFont systemFontOfSize:11]

@interface HeaderView : UIView

@property (nonatomic, assign) NSUInteger coverWidth;
@property (nonatomic, assign) NSUInteger coverHeight;
@property (nonatomic, assign) NSUInteger userAvatarSize;

@property (nonatomic, strong) UIImageView *coverView;

@property (nonatomic, strong) UIImageView *userAvatarView;

@property (nonatomic, strong) MLLabel *userNickView;

@property (nonatomic, strong) MLLabel *userSignView;

@end
