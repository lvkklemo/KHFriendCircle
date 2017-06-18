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
#import "MJExtension.h"
#import "ItemsModel.h"
#import "UIViewExt.h"
#import "HeaderSectionView.h"
#import "CommentCell.h"

static NSString * const HeaderReuseID = @"SectionHeaderView";
static NSString * const CellReuseID = @"SectionHeaderView";

@interface LKTimeLineViewController ()<KKImagesSendViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) NSMutableDictionary *itemDic;

@property (nonatomic, strong) NSMutableDictionary *commentDic;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSUInteger coverWidth;
@property (nonatomic, assign) NSUInteger coverHeight;
@property (nonatomic, assign) NSUInteger userAvatarSize;

@property (nonatomic, strong) UIImageView *coverView;

@property (nonatomic, strong) UIImageView *userAvatarView;

@property (nonatomic, strong) MLLabel *userNickView;

@property (nonatomic, strong) MLLabel *userSignView;


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
    
    [self initTableView];
    UIBarButtonItem* right=[self rightBarButtonItem];
    self.navigationItem.rightBarButtonItem=right;
    
    [self getData];
}

#pragma mark 网络
- (void)getData{
    
//    NSDictionary*data=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]];
//    NSLog(@"%@",data);
    NSData*jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"]];
    NSDictionary*dict=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",[[dict objectForKey:@"data"] objectForKey:@"rows"]);
    NSDictionary*items=[[dict objectForKey:@"data"] objectForKey:@"rows"];
    NSMutableArray*array=[NSMutableArray array];
    array=[ItemsModel mj_objectArrayWithKeyValuesArray:items];
    NSLog(@"%lu",(unsigned long)array.count);
    self.items=array;
    
    [self.tableView reloadData];
    
}
-(void) initTableView
{
    UITableView*tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView=tableView;
    //_tableView.backgroundColor = [UIColor darkGrayColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.separatorInset = UIEdgeInsetsZero;
    HeaderView*headerView=[[HeaderView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, TableHeaderHeight)];
    //headerView.height=TableHeaderHeight;
    tableView.tableHeaderView = headerView;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0.01)];
    [self.view addSubview:tableView];
}


#pragma mark - TableView DataSource

#pragma mark圈子个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.items.count;
}
#pragma mark圈子高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    HeaderSectionView * view=(HeaderSectionView*)[self tableView:tableView viewForHeaderInSection:section];
    NSLog(@"%f",view.height);
    return view.height;
}
#pragma mark圈子内容
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
 HeaderSectionView * view=[tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderReuseID];
    if (view==nil) {
        view=[[HeaderSectionView alloc] initWithReuseIdentifier:HeaderReuseID];
    }
    ItemsModel*itemsModel=self.items[section];
    view.itemsModel=itemsModel;
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
#pragma mark 评论个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ItemsModel*item=self.items[section];
    return item.commentMessages.count;
}

#pragma mark 评论高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemsModel*item=self.items[indexPath.section];
    CommentModel*comment=item.commentMessages[indexPath.row];
    //评论内容高度comment.rowHeight +上下间距16
    return comment.rowHeight;
}
#pragma mark 评论内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ItemsModel*item = self.items[indexPath.section];
    CommentModel*comment=item.commentMessages[indexPath.row];
    
    CommentCell*cell=[tableView dequeueReusableCellWithIdentifier:CellReuseID];
    if (!cell) {
        cell=[[CommentCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellReuseID];
    }
    
    cell.comment=comment;
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    cell.textLabel.text=comment.commentText;;
//    cell.textLabel.font=[UIFont systemFontOfSize:13];
//    cell.textLabel.numberOfLines=0;
//    cell.backgroundColor=DefaultC;
    return cell;
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
