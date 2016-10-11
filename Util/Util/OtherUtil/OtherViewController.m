//
//  OtherViewController.m
//  Util
//
//  Created by 吴孟钦 on 16/10/11.
//  Copyright © 2016年 吴孟钦. All rights reserved.
//

#import "OtherViewController.h"
#import "TitleCell.h"


#define UIScreenWidth               ([UIScreen mainScreen].bounds.size.width)
#define UIScreenHeight              ([UIScreen mainScreen].bounds.size.height)

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
    cataAry = @[@"NSDate使用",@"NSStirng.NSArray.枚举",@"绘图",@"加载更多",@"slider",@"iOS 开发中一些相关的路径",@"应用内打开系统设置界面",@"获取手机安装的应用",@"其他"];
    [self initTextView];
    [self initTableView];
}
- (void)initTextView{
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, 100)];
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
}

- (void)initTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, UIScreenWidth, UIScreenHeight-164)];
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
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
