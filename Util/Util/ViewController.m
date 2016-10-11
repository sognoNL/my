//
//  ViewController.m
//  Util
//
//  Created by 吴孟钦 on 16/10/11.
//  Copyright © 2016年 吴孟钦. All rights reserved.
//

#import "ViewController.h"
#import "TitleCell.h"
#import "DateViewController.h"
#import "YXBaseNavigationController.h"
#import "ArystringViewController.h"
#import "QuartzViewController.h"
#import "LoadMoreViewController.h"
#import "SlideViewController.h"
#import "GetAPPInPhoneViewController.h"
#import "OpenSysSetViewController.h"
#import "FilePathViewController.h"
#import "OtherViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *cataAry;
    UITableView *tableview;
}
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工具方法";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
    cataAry = @[@"NSDate使用",@"NSStirng.NSArray.枚举",@"绘图",@"加载更多",@"slider",@"iOS 开发中一些相关的路径",@"应用内打开系统设置界面",@"获取手机安装的应用",@"其他"];
}
- (void)initTableView{
    tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDevice_W, kDevice_H)];
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
        case 0: //NSDate使用
        {
            DateViewController *dVC = [[DateViewController alloc] init];
            dVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:dVC animated:YES];
        }
            break;
        case 1: //NSStirng.NSArray.枚举
        {
            ArystringViewController *aVC = [[ArystringViewController alloc] init];
            aVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:aVC animated:YES];
        }
            break;
        case 2: //绘图
        {
            QuartzViewController *qVC = [[QuartzViewController alloc] init];
            qVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:qVC animated:YES];
        }
            break;
        case 3: //加载更多
        {
            LoadMoreViewController *lVC = [[LoadMoreViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 4: //slider
        {
            SlideViewController *lVC = [[SlideViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 5: //iOS 开发中一些相关的路径
        {
            FilePathViewController *lVC = [[FilePathViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];

        }
            break;
        case 6: //应用内打开系统设置界面
        {
            OpenSysSetViewController *lVC = [[OpenSysSetViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 7: //获取手机安装的应用
        {
            GetAPPInPhoneViewController *lVC = [[GetAPPInPhoneViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        case 8: //其他
        {
            OtherViewController *lVC = [[OtherViewController alloc] init];
            lVC.title = cataAry[indexPath.row];
            [self.navigationController pushViewController:lVC animated:YES];
        }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
