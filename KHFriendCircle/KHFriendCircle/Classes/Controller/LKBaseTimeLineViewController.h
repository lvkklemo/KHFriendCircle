//
//  LKBaseTimeLineViewController.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKBaseViewController.h"
#import "MLLabel+Size.h"

@interface LKBaseTimeLineViewController : LKBaseViewController<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewing>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSUInteger coverWidth;
@property (nonatomic, assign) NSUInteger coverHeight;
@property (nonatomic, assign) NSUInteger userAvatarSize;

//结束上拉更多
-(void) endLoadMore;

//结束下拉刷新
-(void) endRefresh;

//点击封面上的用户头像
-(void) onClickHeaderUserAvatar;

//设置封面
-(void) setCover:(NSString *) url;

//设置封面上的用户头像
-(void) setUserAvatar:(NSString *) url;

//设置封面上的昵称
-(void) setUserNick:(NSString *)nick;

//设置用户签名
-(void) setUserSign:(NSString *)sign;

@end
