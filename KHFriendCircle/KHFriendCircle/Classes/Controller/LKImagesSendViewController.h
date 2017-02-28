//
//  LKImagesSendViewController.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKBaseViewController.h"

@protocol KKImagesSendViewControllerDelegate <NSObject>
@optional
-(void) onSendTextImage:(NSString *) text images:(NSArray *)images;
@end

@interface LKImagesSendViewController : LKBaseViewController
@property (nonatomic, weak) id<KKImagesSendViewControllerDelegate> delegate;

- (instancetype)initWithImages:(NSArray *) images;
@end
