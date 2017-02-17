//
//  ViewController.m
//  OC交互js
//
//  Created by 毛毛 on 2017/2/17.
//  Copyright © 2017年 锐拓. All rights reserved.
//

#import "ViewController.h"
#import "JSCallOCUseURLViewController.h"
#import "JSCallOCViewController.h"
#import "OCCallJSViewController.h"

#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation ViewController

- (NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = @[@"js调OC通过url",@"JSCallOC",@"OCCallJS"];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"js与OC交互";
    
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"jscell"];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jscell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            JSCallOCUseURLViewController *vc1 = [[JSCallOCUseURLViewController alloc] init];
            [self.navigationController pushViewController:vc1 animated:YES];
        }
            break;
        case 1:
        {
            JSCallOCViewController *vc2 = [[JSCallOCViewController alloc] init];
            [self.navigationController pushViewController:vc2 animated:YES];
        }
            break;
        case 2:
        {
            OCCallJSViewController *vc3 = [[OCCallJSViewController alloc] init];
            [self.navigationController pushViewController:vc3 animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
