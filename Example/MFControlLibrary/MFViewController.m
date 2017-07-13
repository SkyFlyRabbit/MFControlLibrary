//
//  MFViewController.m
//  MFControlLibrary
//
//  Created by 953950782@qq.com on 07/08/2017.
//  Copyright (c) 2017 953950782@qq.com. All rights reserved.
//

#import "MFViewController.h"

#import "MFMutableAttributedStringViewController.h"
#import "MFAlertViewController.h"

@interface MFViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSString *> *titleArray;
@property (nonatomic, copy) NSArray<Class> *classArray;

@property (nonatomic, copy) NSArray<NSDictionary<NSString *, Class> *> *demoInfoArray;

@end

@implementation MFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.demoInfoArray = @[
                           @{@"富文本展示": [MFMutableAttributedStringViewController class]},
                           @{@"提示框": [MFAlertViewController class]}
                          ];
    
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - getter

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 64);
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.demoInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row < self.demoInfoArray.count) {
        cell.textLabel.text = [[self.demoInfoArray[indexPath.row] allKeys] firstObject];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row < self.demoInfoArray.count) {
        Class class = [[self.demoInfoArray[indexPath.row] allValues] firstObject];
        [self.navigationController pushViewController:[[class alloc] init] animated:YES];
    }
}

@end
