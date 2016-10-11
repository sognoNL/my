//
//  OtherViewController.m
//  Util
//
//  Created by 吴孟钦 on 16/10/11.
//  Copyright © 2016年 吴孟钦. All rights reserved.
//

#import "OtherViewController.h"
#import "TitleCell.h"

@interface OtherViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITextView *textView;
    NSArray *cataAry;
    UITableView *tableview;
}
@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    cataAry = @[@"获取汉字的拼音",@"手动更改状态栏的颜色",@"绘图",@"加载更多",@"slider",@"iOS 开发中一些相关的路径",@"应用内打开系统设置界面",@"获取手机安装的应用",@"其他"];
    [self initTextView];
    [self initTableView];
}
- (void)initTextView{
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, kDevice_W, 100)];
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
}

- (void)initTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, kDevice_W, kDevice_H-164)];
    tableview.backgroundColor = [UIColor clearColor];
    tableview.scrollEnabled = NO;
    tableview.showsVerticalScrollIndicator = NO;
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableview];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return cataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TitleCellID = @"TitleCellID";
    TitleCell *cell = (TitleCell *)[YXBaseCell setupCell:tableView withCellID:TitleCellID];
    [cell setCellData:cataAry[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 37.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
        case 0: // 获取汉字的拼音
        {
            textView.text = [self transform:@"曾轶可"];
        }
            break;
        case 1: // 手动更改状态栏的颜色
        {
            [self setStatusBarBackgroundColor:[UIColor greenColor]];
        }
            break;
        case 2: //
        {
           
        }
            break;
        default:
            break;
    }
}

// 获取汉字的拼音
- (NSString *)transform:(NSString *)chinese
{
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [chinese mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    NSLog(@"%@", pinyin);
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    NSLog(@"%@", pinyin);
    //返回最近结果
    return pinyin;
}

// 手动更改状态栏的颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color
{
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
