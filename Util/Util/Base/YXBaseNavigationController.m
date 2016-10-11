//
//  YXBaseNavigationController.m
//  BizYixin
//
//  Created by NL on 15-3-16.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "YXBaseNavigationController.h"
#import "UINavigationBar+CustomImage.h"
#import "NavBarItem.h"

@interface YXBaseNavigationController ()

@end

@implementation YXBaseNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setDefaultNavBarBg];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
//    if ([viewController isKindOfClass:NSClassFromString(@"MsgListViewController")] ||
//        [viewController isKindOfClass:NSClassFromString(@"KeyBorarViewController")] ||
//        [viewController isKindOfClass:NSClassFromString(@"AddressBookMainController")] ||
//        [viewController isKindOfClass:NSClassFromString(@"MeViewController")])
//    {
//        return;
//    }
    if (self.viewControllers.count > 1) {
        UIBarButtonItem *leftItem = [NavBarItem navBackBtnWithTarget:self action:@selector(_backPressed)];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
}

- (void)_backPressed
{
    NSArray *viewcontrollers=self.viewControllers;
    
    if (viewcontrollers.count > 1)
    {
//        if ([viewcontrollers objectAtIndex:viewcontrollers.count - 1] == self)
//        {
            //push方式
            [self popViewControllerAnimated:YES];
//        }
    }
    else
    {
        //present方式
        [self dismissViewControllerAnimated:YES completion:nil];
    }
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self popViewControllerAnimated:YES];
}
//设置statusbar状态栏字体颜色为白色
- (UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
