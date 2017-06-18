//
//  CommentCell.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "CommentCell.h"
#import "UIViewExt.h"

@interface CommentCell ()

@end

@implementation CommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUPUI];
    }
    return self;
}

- (void)setUPUI{
    
    UILabel * commentL =[[UILabel alloc] init];
    _commentLabel=commentL;
    commentL.font=[UIFont systemFontOfSize:kCommentFont];
    commentL.numberOfLines=0;
    [self.contentView addSubview:commentL];
    commentL.backgroundColor=[UIColor groupTableViewBackgroundColor];
}

- (void)setComment:(CommentModel *)comment{
    _comment=comment;
    
    _commentLabel.text=comment.commentText;
    _commentLabel.frame=CGRectMake(2*MARGIN+kAvatarW, 0, KScreenWidth-3*MARGIN-kAvatarW, comment.rowHeight);
//    _commentLabel.frame=CGRectMake(2*MARGIN+kAvatarW, 0, comment.commentSize.width, comment.commentSize.height);
}

@end
