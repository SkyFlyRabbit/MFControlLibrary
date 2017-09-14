//
//  UITableViewCell+SeparatorLine.m
//  Pods
//
//  Created by XuMengFan on 2017/9/11.
//
//

#import "UITableViewCell+SeparatorLine.h"

#import "Masonry.h"

#define CELL_SEPARATOR_LINE_HEIGHT_TAG 30000

static CGFloat global_lineHeight = 0.5;
static UIColor *global_lineColor = nil;

@implementation UITableViewCell (SeparatorLine)

+ (void)load
{
    global_lineColor = [UIColor colorWithRed:240 green:240 blue:240 alpha:1];
}

/**
 * 设置全局的分割线颜色,默认颜色是RGB(240,240,240,1)
 */
+ (void)setGlobalSeparatorLineColor:(UIColor *)color
{
    global_lineColor = color;
}

/**
 * 设置全局的分割线高度,默认高度为0.5
 */
+ (void)setGlobalSeparatorLineHeight:(CGFloat)lineHeight
{
    global_lineHeight = lineHeight;
}

/**
 * 设置分割线样式
 */
- (void)setSeparatorLineWithlLineStyle:(MFSeparatorLineStyle)LineStyle
{
    CGFloat leftMargin = 0;
    CGFloat rightMargin = 0;
    switch (LineStyle) {
        case MFSeparatorLineStyleLeftShort://左15,右0
        {
            leftMargin = 15;
            rightMargin = 0;
        }
            break;
        case MFSeparatorLineStyleRightShort://左0,右15
        {
            leftMargin = 0;
            rightMargin = 15;
        }
            break;
        case MFSeparatorLineStyleDoubleShort://左15,右15
        {
            leftMargin = 15;
            rightMargin = 15;
        }
            break;
        case MFSeparatorLineStyleLong://左0,右0
        {
            leftMargin = 0;
            rightMargin = 0;
        }
            break;
        default:
            break;
    }
    [self setSeparatorLineWithleftMargin:leftMargin rightMargin:rightMargin lineHeight:global_lineHeight lineColor:global_lineColor];
}

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
                             lineColor:(UIColor *)color
{
    UIView *lineView = [self.contentView viewWithTag:CELL_SEPARATOR_LINE_HEIGHT_TAG];
    if (lineView == nil) {
        lineView = [[UIView alloc] init];
        lineView.tag = CELL_SEPARATOR_LINE_HEIGHT_TAG;
        [self.contentView addSubview:lineView];
    }
    lineView.backgroundColor = color;
    
    [lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(height);
        make.left.equalTo(self.contentView.mas_left).with.offset(leftMargin);
        make.right.equalTo(self.contentView.mas_right).with.offset(-rightMargin);
    }];
}

@end
