//
//  LoadMoreViewController.m
//  UtilDemo
//
//  Created by NL on 15-3-30.
//  Copyright (c) 2015年 NL. All rights reserved.
//

#import "LoadMoreViewController.h"
#import "TitleCell.h"

@interface LoadMoreViewController ()
{
    IBOutlet UITableView *mTableView;
    NSMutableArray *items;
    int x;
}
@end

@implementation LoadMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    items = [NSMutableArray arrayWithObjects:@"1",@"2",@"3", nil];
    x = 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [items count] + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *TitleCellID = @"TitleCellID";
    TitleCell *cell = (TitleCell *)[YXBaseCell setupCell:tableView withCellID:TitleCellID];
    
    if([indexPath row] == ([items count]))
    {
         [cell setCellData:@"加载更多"];
    }
    else
    {
        [cell setCellData:items[indexPath.row]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == [items count])
    {
        [self performSelectorInBackground:@selector(loadMore) withObject:nil];
        return;
    }
}

-(void)loadMore
{
    NSMutableArray *more= [NSMutableArray arrayWithObjects:@"a",@"b",@"c", nil];
    //加载你的数据
    [self performSelectorOnMainThread:@selector(appendTableWith:) withObject:more waitUntilDone:NO];
    x ++;
}

- (void)appendTableWith:(NSMutableArray *)data
{
        for (int i=0;i<[data count];i++)
        {
            [items addObject:[NSString stringWithFormat:@"%d%@",x,[data objectAtIndex:i]]];
        }
        NSMutableArray *insertIndexPaths = [NSMutableArray arrayWithCapacity:10];
        for (int ind = 0; ind < [data count]; ind++)
        {
            NSIndexPath *newPath =  [NSIndexPath indexPathForRow:
                                     [items indexOfObject:[NSString stringWithFormat:@"%d%@",x,[data objectAtIndex:ind]]] inSection:0];
            [insertIndexPaths addObject:newPath];
        }  
        [mTableView insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationFade];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
