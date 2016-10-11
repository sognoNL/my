//
//  QuartzViewController.m
//  UtilDemo
//
//  Created by NL on 15-3-30.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "QuartzViewController.h"
#import "CustomView.h"

@interface QuartzViewController ()

@end

@implementation QuartzViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:customView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
