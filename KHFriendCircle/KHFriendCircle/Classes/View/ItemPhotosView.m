//
//  ItemPhotosView.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/18.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "ItemPhotosView.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

#define MAX_COL 3

//代表每一个子控件的大小
#define CHILD_WH ((KScreenWidth-3*MARGIN-kAvatarW - 3*MARGIN) / MAX_COL)

@interface ItemPhotosView ()

@end
@implementation ItemPhotosView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        for (int i=0; i<9; i++) {
            UIImageView*imageView=[[UIImageView alloc] init];
            imageView.contentMode=UIViewContentModeScaleAspectFill;
            imageView.clipsToBounds=YES;
            [self addSubview:imageView];
        }
    }
    return self;
}

- (void)setPic_urls:(NSArray *)pic_urls{
    _pic_urls=pic_urls;
    //先hidden
    //    [self.subviews makeObjectsPerformSelector:@selector(setHidden:) withObject:@(YES)];
    for (int i=0; i<self.subviews.count; i++) {
        UIView *childView = self.subviews[i];
        childView.hidden = YES;
    }
    
    for (int i=0; i<pic_urls.count; i++) {
        UIImageView *childView = self.subviews[i];
        childView.hidden = NO;
        //填充数据
        
        NSString *info = pic_urls[i];
        [childView sd_setImageWithURL:[NSURL URLWithString:info] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
        
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //计算每一个子控件的位置与大小
    //CGFloat childWH = CHILD_WH;
    NSInteger MAX_COLS =self.pic_urls.count == 4 ?2:MAX_COL;
    
    for (int i=0; i<self.subviews.count; i++) {
        UIView*childView=self.subviews[i];
        childView.backgroundColor=[UIColor redColor];
        //计算当前控件在哪一行
        NSInteger row = i / MAX_COLS;
        //计算当前控件在哪一列
       NSInteger col = i % MAX_COLS;
        
    childView.x = col*(CHILD_WH+MARGIN);
    childView.y = row*(CHILD_WH+MARGIN);
    childView.size=CGSizeMake(CHILD_WH, CHILD_WH);
    }
    
}

+(CGSize) sizeWithPhotosCount:(NSInteger)count{
    
//    if (count<3) {
//        return CGSizeMake(100, 100);
//    }else if (count>=3 && count<6){
//        return CGSizeMake(100, 200);
//    }else if (count>=6 && count<9){
//        return CGSizeMake(100, 300);
//    }
//    return CGSizeMake(150, 150);
    
    //其他情况,一律按3列来排
    //如果是4张,2行2列
    
    //计算每一个子控件的宽度与高度
    //375
    CGFloat childWH = CHILD_WH;
    
    //先计算出有多少列
    NSInteger col = count>=MAX_COL?MAX_COL:count;
    if (count == 4) {
        col = 2;
    }
    
    //计算行数
    //6张图-->2
    //    NSInteger row = count / col + (count % col == 0? 0:1);
    NSInteger row = (count + MAX_COL - 1) / MAX_COL;
    
    CGFloat height = row * childWH + (row - 1) * MARGIN;
    CGFloat width = col * childWH + (col - 1) * MARGIN;
    
    return CGSizeMake(width, height);

    
}

@end
