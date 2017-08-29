//
//  NSMutableAttributedString+ContentStyle.h
//  Pods
//
//  Created by XuMengFan on 2017/8/29.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (ContentStyle)

#pragma mark ========== 字体大小和颜色 ==========

/**
 * 改变指定范围内字符串的字体和颜色
 *
 * @param color UIColor类型,可以为nil
 * @param font UIFont类型, 可以为nil
 * @param range NSRange类型,不可为nil
 */
- (void)addColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range;

/**
 * 改变多处指定范围内字符串的字体和颜色
 *
 * @param colorArray 颜色数组,可以为nil
 * @param fontArray 字体数组,可以为nil
 * @param rangeArray 范围数组,不可以为nil
 */
- (void)addColorArray:(NSArray<UIColor *> *)colorArray fontArray:(NSArray<UIFont *> *)fontArray rangeArray:(NSArray *)rangeArray;

#pragma mark ========== 图片转富文本 ==========

/**
 * 将图片转化为富文本
 *
 * @param image 图片
 * @return 富文本
 */
+ (NSAttributedString *)attributedStringFromImage:(UIImage *)image;

#pragma mark ========== UIView转图片/富文本 ==========

/**
 * 将view转换为富文本(清晰度不够,不建议使用)
 *
 * @param view UIView
 * @return 富文本
 */
+ (NSAttributedString *)attributedStringFromView:(UIView *)view;

/**
 * 将view转换为图片
 *
 * @param view UIView
 * @return 图片
 */
+ (UIImage *)imageFromView:(UIView *)view;

#pragma mark ========== 删除线 ==========

/**
 * 添加中间删除线
 *
 * @param range NSRange
 */
- (void)addStrikethroughInRange:(NSRange)range;

/**
 * 添加中间删除线(删除线的颜色自定义)
 *
 @param range NSRange
 @param color UIColor,可以为nil
 */
- (void)addStrikethroughInRange:(NSRange)range withColor:(UIColor *)color;

#pragma mark ========== 下滑线 ==========

/**
 * 添加下划线(下划线颜色可自定义,也可传nil)
 */
- (void)addUnderLineInRange:(NSRange)range withColor:(UIColor *)color;

@end
