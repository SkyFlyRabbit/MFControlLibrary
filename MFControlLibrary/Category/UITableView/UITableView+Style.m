//
//  UITableView+Style.m
//  Pods
//
//  Created by XuMengFan on 2017/12/25.
//
//

#import "UITableView+Style.h"

#import <objc/runtime.h>

@interface UITableView ()

@property (nonatomic, strong, readwrite) UIView *customTableHeaderView;
@property (nonatomic, strong, readwrite) UIView *customTableFooterView;

@end

@implementation UITableView (Style)

- (void)setZeroTableHeaderView
{
    UIView *tableHeaderView = [[UIView alloc] init];
    tableHeaderView.frame = CGRectZero;
    self.tableFooterView = tableHeaderView;
}

- (void)setZeroTableFooterView
{
    UIView *tableFooterView = [[UIView alloc] init];
    tableFooterView.frame = CGRectZero;
    self.tableFooterView = tableFooterView;
}

#pragma mark - getters

- (UIView *)customTableHeaderView
{
    UIView *customTableHeaderView = objc_getAssociatedObject(self, _cmd);
    if (customTableHeaderView == nil) {
        customTableHeaderView = [[UIView alloc] init];
        customTableHeaderView.frame = CGRectZero;
        objc_setAssociatedObject(self, _cmd, customTableHeaderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return customTableHeaderView;
}

- (UIView *)customTableFooterView
{
    UIView *customTableFooterView = objc_getAssociatedObject(self, _cmd);
    if (customTableFooterView == nil) {
        customTableFooterView = [[UIView alloc] init];
        customTableFooterView.frame = CGRectZero;
        objc_setAssociatedObject(self, _cmd, customTableFooterView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return customTableFooterView;
}

@end
