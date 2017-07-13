//
//  MFAlertViewController.m
//  MFControlLibrary
//
//  Created by XuMengFan on 2017/7/10.
//  Copyright © 2017年 953950782@qq.com. All rights reserved.
//

#import "MFAlertViewController.h"

#import <MFControlLibrary/MFCommonToolHeader.h>

@interface MFAlertViewController ()

@end

@implementation MFAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(20, (self.view.bounds.size.height - 50 - 64) / 2 - 64, self.view.bounds.size.width - 40, 50);
    [button setTitle:@"警告框" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - button menthod

- (void)present
{
    [MFAlterView showAlertWithTitle:@"确定取消?" message:@"订单金额巨大,请慎重" buttonTitleArray:@[@"确定", @"取消"] handler:^(NSInteger index) {
        NSLog(@"index = %ld", (long)index);
    }];
}

@end
