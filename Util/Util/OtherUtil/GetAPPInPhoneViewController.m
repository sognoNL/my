//
//  GetAPPInPhoneViewController.m
//  Util
//
//  Created by 吴孟钦 on 16/10/11.
//  Copyright © 2016年 吴孟钦. All rights reserved.
//

#import "GetAPPInPhoneViewController.h"
#define UIScreenWidth               ([UIScreen mainScreen].bounds.size.width)
#define UIScreenHeight              ([UIScreen mainScreen].bounds.size.height)

@interface GetAPPInPhoneViewController ()
{
    UITextView *textView;
}
@end

@implementation GetAPPInPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ;
    [self initTextView];
    textView.text = [NSString stringWithFormat:@"%@",[self getAppInPhone]];
}

- (void)initTextView{
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, UIScreenWidth, UIScreenHeight-64)];
    [self.view addSubview:textView];
}

- (NSMutableArray *)getAppInPhone{
    Class c = NSClassFromString(@"LSApplicationWorkspace");
    id s = [(id)c performSelector:NSSelectorFromString(@"defaultWorkspace")];
    NSArray *array = [s performSelector:NSSelectorFromString(@"allInstalledApplications")];
    NSMutableArray *appArray = [NSMutableArray array];
    for (id item in array)
    {
//        NSMutableArray *appInfoArray = [NSMutableArray arrayWithCapacity:3];
//        [appInfoArray addObject:[NSString stringWithFormat:@"bundleID：%@",[item performSelector:NSSelectorFromString(@"bundleIdentifier")]]];
//        [appInfoArray addObject:[NSString stringWithFormat:@"build：%@",[item performSelector:NSSelectorFromString(@"bundleVersion")]]];
//        [appInfoArray addObject:[NSString stringWithFormat:@"版本号：%@",[item performSelector:NSSelectorFromString(@"shortVersionString")]]];
//
//        NSLog(@"====%@",appInfoArray);
        [appArray addObject:[NSString stringWithFormat:@"%@",[item performSelector:NSSelectorFromString(@"bundleIdentifier")]]];
    }
    return appArray;
}

@end
