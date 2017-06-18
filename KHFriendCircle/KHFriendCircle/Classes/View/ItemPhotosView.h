//
//  ItemPhotosView.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/18.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemsModel.h"

@interface ItemPhotosView : UIView

@property(nonatomic,strong) NSArray * pic_urls;
+(CGSize) sizeWithPhotosCount:(NSInteger)count;
@end
