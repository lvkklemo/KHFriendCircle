//
//  LKImagesSendViewController.m
//  KHFriendCircle
//
//  Created by 宇航 on 17/2/28.
//  Copyright © 2017年 KH. All rights reserved.
//

#import "LKImagesSendViewController.h"
#import "UIBarButtonItem+Lite.h"


@interface LKImagesSendViewController ()
@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) UITextView *contentView;

@property (nonatomic, strong) UIView *mask;

@property (nonatomic, strong) UILabel *placeholder;

//@property (nonatomic, strong) DFPlainGridImageView *gridView;

@property (nonatomic, strong) UIImagePickerController *pickerController;

@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation LKImagesSendViewController

- (instancetype)initWithImages:(NSArray *) images
{
    self = [super init];
    if (self) {
        _images = [NSMutableArray array];
        if (images != nil) {
            [_images addObjectsFromArray:images];
            [_images addObject:[UIImage imageNamed:@"AlbumAddBtn"]];
        }
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
      self.title = @"";
    [self initView];
    
}
-(void) initView
{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat x, y, width, heigh;
    x=10;
    y=74;
    width = self.view.frame.size.width -2*x;
    heigh = 100;
    _contentView = [[UITextView alloc] initWithFrame:CGRectMake(x, y, width, heigh)];
    _contentView.scrollEnabled = YES;
//    _contentView.delegate = self;
    _contentView.font = [UIFont systemFontOfSize:17];
    //_contentView.layer.borderColor = [UIColor redColor].CGColor;
    //_contentView.layer.borderWidth =2;
    [self.view addSubview:_contentView];
    
    //placeholder
    _placeholder = [[UILabel alloc] initWithFrame:CGRectMake(x+5, y+5, 150, 25)];
    _placeholder.text = @"这一刻的想法...";
    _placeholder.font = [UIFont systemFontOfSize:14];
    _placeholder.textColor = [UIColor lightGrayColor];
    _placeholder.enabled = NO;
    [self.view addSubview:_placeholder];
    
    
//    _gridView = [[DFPlainGridImageView alloc] initWithFrame:CGRectZero];
//    _gridView.delegate = self;
//    [self.view addSubview:_gridView];
    
    
    _mask = [[UIView alloc] initWithFrame:self.view.bounds];
    _mask.backgroundColor = [UIColor clearColor];
    _mask.hidden = YES;
    [self.view addSubview:_mask];
    
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanAndTap:)];
    [_mask addGestureRecognizer:_panGestureRecognizer];
    _panGestureRecognizer.maximumNumberOfTouches = 1;
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPanAndTap:)];
    [_mask addGestureRecognizer:_tapGestureRecognizer];
    
    
    
    [self refreshGridImageView];
}

-(void) refreshGridImageView
{
    CGFloat x, y, width, heigh;
//    x=10;
//    y = CGRectGetMaxY(_contentView.frame)+10;
//    width  = ImageGridWidth;
//    heigh = [DFPlainGridImageView getHeight:_images maxWidth:width];
//    _gridView.frame = CGRectMake(x, y, width, heigh);
//    [_gridView updateWithImages:_images];
}

-(UIBarButtonItem *)leftBarButtonItem
{
    return [UIBarButtonItem text:@"取消" selector:@selector(cancel) target:self];
}

-(UIBarButtonItem *)rightBarButtonItem
{
    return [UIBarButtonItem text:@"发送" selector:@selector(send) target:self];
}

-(void) cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) send
{
    if (_delegate && [_delegate respondsToSelector:@selector(onSendTextImage:images:)]) {
        
        [_images removeLastObject];
        [_delegate onSendTextImage:_contentView.text images:_images];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void) onPanAndTap:(UIGestureRecognizer *) gesture
{
    _mask.hidden = YES;
    [_contentView resignFirstResponder];
}


@end
