//
//  ItemsModel.h
//  KHFriendCircle
//
//  Created by 宇航 on 17/6/16.
//  Copyright © 2017年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentModel.h"
#import "MJExtension.h"

@interface ItemsModel : NSObject

@property(nonatomic,assign)NSInteger cid;
@property(nonatomic,assign)NSInteger message_id;
@property(nonatomic,copy)NSString* message;
@property(nonatomic,copy)NSString* createDate;
@property(nonatomic,copy)NSString* timeTag;
@property(nonatomic,copy)NSString* createDateStr;
@property(nonatomic,copy)NSString* userName;
@property(nonatomic,copy)NSString* photo;
@property(nonatomic,strong)NSMutableArray * likeUsers;
@property(nonatomic,strong)NSMutableArray* messageSmallPics;
@property(nonatomic,strong)NSMutableArray* messageBigPics;
@property(nonatomic,strong)NSMutableArray<CommentModel*>* commentMessages;

@end


//"cid":"1",
//"message_id":656,
//"message":"杀马特一词源于英文单词smart,可以译为时尚的；聪明的，在中国正式发展始于2008年，是结合日本视觉系和欧美摇滚的结合体，喜欢并盲目模仿日本视觉系摇滚乐队的衣服、头发等等，看不惯的网友们将他们称为“山寨系”，“脑残”划上等号脑残族并列。",
//"createDate":1463646327000,
//"timeTag":"2天前",
//"createDateStr":"2016-05-19 16:25",
//"objId":"f1562484",
//"message_type":"text",
//"checkStatus":"YES",
//"userId":82,
//"userName":"杀马特",
//"likeUsers":["文明","刘德华","谭咏麟","梅艳芳","Eason","Beyond"],
//"photo":"http://weixintest.ihk.cn/ihkwx_upload/userPhoto/15914867203-1461920972642.jpg",
//"messageSmallPics":[
//                    "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160503/14622764778932thumbnail.jpg",
//                    "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160426/14616659617000.jpg",
//                    "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160519/14636463273461.JPEG"
//                    ],
//"messageBigPics":[
//                  "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160503/14622764778932thumbnail.jpg",
//                  "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160426/14616659617000.jpg",
//                  "http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160519/14636463273461.JPEG"
//                  ],
//"commentMessages":[
//                   {
//                       "commentId":"1",
//                       "commentUserId":97,
//                       "commentUserName":"怕瓦落地",
//                       "commentPhoto":"http://weixintest.ihk.cn/ihkwx_upload/commentPic/20160307/14573358906810.JPEG",
//                       "commentText":"杀马特遇见洗剪吹",
//                       "commentByUserId":"",
//                       "commentByUserName":"",
//                       "commentByPhoto":"",
//                       "createDate":1463641914000,
//                       "createDateStr":"2016-05-19 15:11",
//                       "checkStatus":"YES"
//                   },
//                   {
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
//                   ]
