//
//  CommentModel.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "CommentModel.h"
#import "UIViewExt.h"

@implementation CommentModel

- (CGFloat)rowHeight{
    
    NSDictionary*attribute=@{NSFontAttributeName:[UIFont systemFontOfSize:kCommentFont
                                                  ]};
    
    CGRect rect =[self.commentText boundingRectWithSize:CGSizeMake(KScreenWidth-3*MARGIN-kAvatarW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    
    return rect.size.height;
}

- (CGSize)commentSize{
    NSDictionary*attribute=@{NSFontAttributeName:[UIFont systemFontOfSize:kCommentFont
                                                  ]};
    
    CGRect rect =[self.commentText boundingRectWithSize:CGSizeMake(KScreenWidth-3*MARGIN-kAvatarW, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil];
    return rect.size;
}
@end
