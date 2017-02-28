//
//  LKTimeLineViewController.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKTimeLineViewController.h"
#import "UIBarButtonItem+Lite.h"
#import "MMPopupView.h"
#import "MMPopupItem.h"
#import "MMSheetView.h"
#import "LKImagesSendViewController.h"

@interface LKTimeLineViewController ()<KKImagesSendViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) NSMutableDictionary *itemDic;

@property (nonatomic, strong) NSMutableDictionary *commentDic;
@end

@implementation LKTimeLineViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _items = [NSMutableArray array];
        
        _itemDic = [NSMutableDictionary dictionary];
        
        _commentDic = [NSMutableDictionary dictionary];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - BarButtonItem


-(UIBarButtonItem *)rightBarButtonItem
{
    UIBarButtonItem *item = [UIBarButtonItem icon:@"Camera" selector:@selector(onClickCamera:) target:self];
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPressCamera:)];
    [item.customView addGestureRecognizer:recognizer];
    return item;
}

-(void) onLongPressCamera:(UIGestureRecognizer *) gesture
{
    LKImagesSendViewController *controller = [[LKImagesSendViewController alloc] initWithImages:nil];
    controller.delegate = self;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navController animated:YES completion:nil];
}



-(void) onClickCamera:(id) sender
{
    MMPopupItemHandler block = ^(NSInteger index){
        switch (index) {
            case 0:
                //[self captureViedo];
                break;
            case 1:
                //[self takePhoto];
                break;
            case 2:
                //[self pickFromAlbum];
                break;
            default:
                break;
        }
    };
    
    NSArray *items = @[MMItemMake(@"小视频", MMItemTypeNormal, block),
                       MMItemMake(@"拍照", MMItemTypeNormal, block),
                       MMItemMake(@"从相册选取", MMItemTypeNormal, block)];
    
    MMSheetView *sheetView = [[MMSheetView alloc] initWithTitle:@"" items:items];
    
    [sheetView show];
}

@end
