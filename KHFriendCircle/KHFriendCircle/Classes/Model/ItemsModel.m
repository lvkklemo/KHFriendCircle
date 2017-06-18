//
//  ItemsModel.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/16.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "ItemsModel.h"

@implementation ItemsModel
MJExtensionCodingImplementation

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"commentMessages":@"CommentModel"}
    ;
}
@end
