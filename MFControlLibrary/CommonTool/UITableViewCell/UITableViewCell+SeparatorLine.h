//
//  UITableViewCell+SeparatorLine.h
//  Pods
//
//  Created by XuMengFan on 2017/9/11.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MFSeparatorLineStyle) {//分割线样式,分割线距离左右两侧的距离
    MFSeparatorLineStyleLeftShort   = 1,/**< 左15,右0*/
    MFSeparatorLineStyleRightShort  = 2,/**< 左0,右15*/
    MFSeparatorLineStyleDoubleShort = 3,/**< 左15,右15*/
    MFSeparatorLineStyleLong        = 4,/**< 左0,右0*/
    MFSeparatorLineStyleDefalut     = MFSeparatorLineStyleLeftShort,
};

@interface UITableViewCell (SeparatorLine)

/**
 * 设置全局的分割线颜色,默认颜色是RGB(240,240,240,1)
 */
+ (void)setGlobalSeparatorLineColor:(UIColor *)color;

/**
 * 设置全局的分割线高度,默认高度为0.5
 */
+ (void)setGlobalSeparatorLineHeight:(CGFloat)lineHeight;

/**
 * 设置分割线样式
 */
- (void)setSeparatorLineWithlLineStyle:(MFSeparatorLineStyle)LineStyle;

/**
 * 设置自定义分割线样式
 *
 * @param leftMargin 左边界距离
 * @param rightMargin 右边界距离
 * @param height 分割线线高度
 * @param color 分割线颜色
 */
- (void)setSeparatorLineWithleftMargin:(CGFloat)leftMargin
                           rightMargin:(CGFloat)rightMargin
                            lineHeight:(CGFloat)height
                             lineColor:(UIColor *)color;

@end
