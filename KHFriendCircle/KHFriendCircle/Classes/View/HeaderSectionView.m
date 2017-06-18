//
//  HeaderSectionView.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "HeaderSectionView.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "ItemPhotosView.h"


@interface HeaderSectionView ()

@end
@implementation HeaderSectionView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor=[UIColor whiteColor];
        UIImageView*iconView=[[UIImageView alloc] init];
        [self addSubview:iconView];
        _iconView=iconView;
        
        UILabel*nameLabel=[[UILabel alloc] init];
        [self addSubview:nameLabel];
        _nameLabel=nameLabel;
        
        UILabel*timeLabel=[[UILabel alloc] init];
        [self addSubview:timeLabel];
        _timeLabel=timeLabel;
        
        UILabel*contentLabel=[[UILabel alloc] init];
        [self addSubview:contentLabel];
        _contentLabel=contentLabel;
        
        UIView*botttomL=[[UIView alloc] init];
        [self addSubview:botttomL];
        botttomL.backgroundColor= DefaultC;
        _botttomLine=botttomL;
        
        nameLabel.font=[UIFont systemFontOfSize:16];
        timeLabel.font=[UIFont systemFontOfSize:14];
        timeLabel.textColor=[UIColor lightGrayColor];
        contentLabel.font=[UIFont systemFontOfSize:14];
        contentLabel.numberOfLines=0;
        
    }
    return self;
}

- (void)setItemsModel:(ItemsModel *)itemsModel{
    _itemsModel=itemsModel;
   
    [_iconView sd_setImageWithURL:[NSURL URLWithString:itemsModel.photo] placeholderImage:nil];
    _iconView.frame=CGRectMake(MARGIN, MARGIN, 50, 50);
    
    _nameLabel.text=itemsModel.userName;
    _nameLabel.frame=CGRectMake(_iconView.right+MARGIN, _iconView.y+4, KScreenWidth-_iconView.width-3*MARGIN, 20);
    
    _timeLabel.text=itemsModel.timeTag;
    _timeLabel.frame=CGRectMake(_nameLabel.x, _nameLabel.bottom+8, _nameLabel.width, 20);
    
    //圈子的内容
    NSDictionary*attribute=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    CGSize size = [itemsModel.message boundingRectWithSize:CGSizeMake(_nameLabel.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    _contentLabel.text=itemsModel.message;
    _contentLabel.frame=CGRectMake(_nameLabel.x, _iconView.bottom+MARGIN, size.width, size.height);
    
    
    //解决配图cell重用的问题
    for (UIView*aView in self.subviews) {
        if ([aView isKindOfClass:[ItemPhotosView class]]) {
            [aView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            [aView removeFromSuperview];
        }
    }
    //如果有配图
    if (itemsModel.messageSmallPics.count) {
        //图片
        ItemPhotosView*photoView=[[ItemPhotosView alloc] init];
        
        [photoView setPic_urls:itemsModel.messageSmallPics];
        [self addSubview:photoView];
        _photoView=photoView;
        
        CGFloat photoVW = KScreenWidth-3*MARGIN-kAvatarW;
        CGFloat photoVH = [ItemPhotosView sizeWithPhotosCount:itemsModel.messageSmallPics.count].height;
        _photoView.frame=CGRectMake(_nameLabel.x, _contentLabel.bottom+4,photoVW,photoVH);
        
        _photoView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _botttomLine.frame=CGRectMake(MARGIN, CGRectGetMaxY(_photoView.frame)+10-1, KScreenWidth-MARGIN, 1);
        self.frame=CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_photoView.frame)+10);
    }else{
        _botttomLine.frame=CGRectMake(MARGIN, CGRectGetMaxY(_contentLabel.frame)+10-1, KScreenWidth-MARGIN, 1);
        self.frame=CGRectMake(0, 0, KScreenWidth, CGRectGetMaxY(_contentLabel.frame)+10);
    }
    
    

}

@end
