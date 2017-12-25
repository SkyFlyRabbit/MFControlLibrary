//
//  UITableView+Style.h
//  Pods
//
//  Created by XuMengFan on 2017/12/25.
//
//

#import <UIKit/UIKit.h>

@interface UITableView (Style)

- (void)setZeroTableHeaderView;

- (void)setZeroTableFooterView;

@property (nonatomic, strong, readonly) UIView *customTableHeaderView;
@property (nonatomic, strong, readonly) UIView *customTableFooterView;

@end
