//
//  LKBaseViewController.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKBaseViewController.h"

@interface LKBaseViewController ()

@end

@implementation LKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"WeChat";
    
    if ([self rightBarButtonItem] != nil) {
        self.navigationItem.rightBarButtonItem = [self rightBarButtonItem];
    }
    
}

-(UIBarButtonItem *) rightBarButtonItem
{
    return nil;
}

@end
