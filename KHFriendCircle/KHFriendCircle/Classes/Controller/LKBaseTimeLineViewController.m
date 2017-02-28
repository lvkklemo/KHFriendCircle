//
//  LKBaseTimeLineViewController.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKBaseTimeLineViewController.h"

@interface LKBaseTimeLineViewController ()
@property (nonatomic, strong) UIImageView *coverView;

@property (nonatomic, strong) UIImageView *userAvatarView;

@property (nonatomic, strong) MLLabel *userNickView;

@property (nonatomic, strong) MLLabel *userSignView;

@property (strong, nonatomic) UIRefreshControl *refreshControl;

@property (nonatomic, strong) UIView *footer;

@property (nonatomic, assign) BOOL isLoadingMore;
@end

@implementation LKBaseTimeLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}


@end
