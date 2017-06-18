//
//  CommentModel.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/17.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCommentFont  14
#define MARGIN 10
#define kAvatarW 50
//static NSString *  CommentTextFont = 14;
//static NSString * const reuseID = @"SectionHeaderView";

@interface CommentModel : NSObject
@property(nonatomic,assign)NSInteger commentId;
@property(nonatomic,assign)NSInteger commentUserId;
@property(nonatomic,copy)NSString* commentUserName;
@property(nonatomic,copy)NSString* commentPhoto;
@property(nonatomic,copy)NSString* commentText;
@property(nonatomic,copy)NSString* createDate;
@property(nonatomic,copy)NSString* createDateStr;
@property(nonatomic,assign)BOOL checkStatus;
@property(nonatomic,assign)CGFloat rowHeight;
@property(nonatomic,assign)CGSize commentSize;
@end


    //                       "commentId":"2",
    //                       "commentUserId":97,
    //                       "commentUserName":"怕瓦落地",
    //                       "commentPhoto":"http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160307/14573358906810.JPEG",
    //                       "commentText":"你妈妈一直说我老土，我就找了村口王师傅烫头，她就不会再来拆散我俩",
    //                       "commentByUserId":"",
    //                       "commentByUserName":"",
    //                       "commentByPhoto":"",
    //                       "createDate":1463641914000,
    //                       "createDateStr":"2016-05-19 15:11",
    //                       "checkStatus":"YES"
    //                   }
