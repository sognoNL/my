//
//  SlideViewController.m
//  UtilDemo
//
//  Created by 吴孟钦 on 15/7/27.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "SlideViewController.h"
#import "SlideButtonView.h"

@interface SlideViewController ()<UIScrollViewDelegate,SlideButtonViewDelegate>
{
    NSInteger currentPage;
}
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIScrollView *btnsScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *pagesScrollView;
@property (strong, nonatomic) NSMutableArray *slideTitles;
@end

@implementation SlideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _slideTitles = [NSMutableArray arrayWithObjects:@"公司",@"有限公司",@"国企",@"阿里巴巴", nil];
    currentPage = 0;
    
    [self initPagesScrollView];
    [self initbtnsScrollView];
    
}

- (void)initbtnsScrollView
{
    CGFloat lastOffX = 0;
    for (int i = 0;i<_slideTitles.count;i++)
    {
        SlideButtonView *slideBtn = [[SlideButtonView alloc] initSlideButtonViewWithFrame:CGRectMake(lastOffX, 0, 0, self.btnsScrollView.frame.size.height) title:_slideTitles[i] tag:i];
        slideBtn.delegate = self;
        [self selectBtnWithTag:0];
        [self.btnsScrollView addSubview:slideBtn];
        lastOffX = slideBtn.frame.origin.x+slideBtn.frame.size.width;
    }
    
}

- (void)initPagesScrollView
{
    _pagesScrollView.pagingEnabled = YES;
    _pagesScrollView.clipsToBounds = YES;
    _pagesScrollView.contentSize = CGSizeMake(_pagesScrollView.frame.size.width * _slideTitles.count, 0);
    _pagesScrollView.showsHorizontalScrollIndicator = NO;
    _pagesScrollView.showsVerticalScrollIndicator = NO;
    _pagesScrollView.scrollsToTop = NO;
    _pagesScrollView.delegate = self;
    [_pagesScrollView setContentOffset:CGPointMake(0, 0)];

    [self createAllEmptyPagesForScrollView];
}
- (void)createAllEmptyPagesForScrollView
{
    for (int i = 0;i<_slideTitles.count;i++)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(_pagesScrollView.frame.size.width*i, 0 , _pagesScrollView.frame.size.width, _pagesScrollView.frame.size.height+100)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, _pagesScrollView.frame.size.width, 40)];
        label.text = _slideTitles[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        [view addSubview:label];
        [_pagesScrollView addSubview:view];
    }
}

- (NSInteger)tableView:tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.pagesScrollView.frame.size.width;
    int page = floor((self.pagesScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    currentPage = page;
    [self selectBtnWithTag:page];
}

- (void)selectBtnWithTag:(NSInteger)tag
{
    for (UIView *subView in self.btnsScrollView.subviews)
    {
        if ([subView isKindOfClass:[SlideButtonView class]])
        {
            SlideButtonView *slideBtn = (SlideButtonView *)subView;
            [slideBtn selectBtn:slideBtn.titleButton.tag == tag];
        }
    }
    currentPage = tag;
    
    [UIView beginAnimations:nil context:nil];//动画开始
    [UIView setAnimationDuration:0.3];
    [_pagesScrollView setContentOffset:CGPointMake(kDevice_W * currentPage, 0)];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
