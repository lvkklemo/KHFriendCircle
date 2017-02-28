//
//  AppDelegate.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/22.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "AppDelegate.h"
#import "LKViewController.h"

#define NavBarBgColor [UIColor colorWithRed:24/255.0 green:30/255.0 blue:43/255.0 alpha:1.0]
#define NavBarFgColor [UIColor whiteColor]
#define NavTextAttribute @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}

@interface AppDelegate ()
@property (nonatomic, strong) LKViewController *controller;
@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _controller = [[LKViewController alloc] init];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:_controller];
    
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = nav;
    _window.backgroundColor = [UIColor whiteColor];
    
    [_window makeKeyAndVisible];
    
    application.statusBarStyle = UIStatusBarStyleLightContent;
    [UINavigationBar appearance].barTintColor =NavBarBgColor;
    [UINavigationBar appearance].tintColor = NavBarFgColor;
    [UINavigationBar appearance].titleTextAttributes = NavTextAttribute;
    
    
    return YES;
}



@end
