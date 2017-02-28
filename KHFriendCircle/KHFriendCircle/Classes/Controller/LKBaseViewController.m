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
    
     self.navigationItem.rightBarButtonItem = [self rightBarButtonItem];
 
     self.navigationItem.leftBarButtonItem = [self leftBarButtonItem];
   
    
}

-(UIBarButtonItem *) rightBarButtonItem
{
    return nil;
}

-(UIBarButtonItem *) leftBarButtonItem
{
    return nil;
}


@end
