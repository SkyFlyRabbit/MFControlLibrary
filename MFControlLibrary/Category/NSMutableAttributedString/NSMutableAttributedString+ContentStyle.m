
//
//  NSMutableAttributedString+ContentStyle.m
//  Pods
//
//  Created by XuMengFan on 2017/8/29.
//
//

#import "NSMutableAttributedString+ContentStyle.h"

@implementation NSMutableAttributedString (ContentStyle)

#pragma mark ========== 字体大小和颜色 ==========

/**
 * 改变指定范围内字符串的字体和颜色
 *
 * @param color UIColor类型,可以为nil
 * @param font UIFont类型, 可以为nil
 * @param range NSRange类型,不可为nil
 */
- (void)addColor:(UIColor *)color font:(UIFont *)font range:(NSRange)range
{
    if (color && font) {
        [self addAttributes:@{NSForegroundColorAttributeName : color,
                              NSFontAttributeName : font} range:range];
    }else {
        if (color) {
            [self addAttributes:@{NSForegroundColorAttributeName : color} range:range];
        }
        if (font) {
            [self addAttributes:@{NSFontAttributeName : font} range:range];
        }
    }
}

/**
 * 改变多处指定范围内字符串的字体和颜色
 *
 * @param colorArray 颜色数组,可以为nil
 * @param fontArray 字体数组,可以为nil
 * @param rangeArray 范围数组,不可以为nil
 */
- (void)addColorArray:(NSArray<UIColor *> *)colorArray fontArray:(NSArray<UIFont *> *)fontArray rangeArray:(NSArray *)rangeArray
{
    for (int i = 0; i < rangeArray.count; i++) {
        NSInteger colorNum = 0;
        UIColor * color = nil;
        if (colorArray) {
            if (i < colorArray.count) {
                colorNum = i;
            }else {
                colorNum = colorArray.count - 1;
            }
            color = colorArray[colorNum];
        }
        
        NSInteger fontNum = 0;
        UIFont * font = nil;
        if (fontArray) {
            if (i < fontArray.count) {
                fontNum = i;
            }else {
                fontNum = fontArray.count - 1;
            }
            font = fontArray[fontNum];
        }
        
        [self addColor:color font:font range:[rangeArray[i] rangeValue]];
    }
}

#pragma mark ========== 图片转富文本 ==========

/**
 * 将图片转化为富文本
 *
 * @param image 图片
 * @return 富文本
 */
+ (NSAttributedString *)attributedStringFromImage:(UIImage *)image
{
    NSTextAttachment * textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = image;
    textAttachment.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    NSAttributedString * attributeString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    return attributeString;
}

#pragma mark ========== UIView转图片/富文本 ==========

/**
 * 将view转换为富文本(清晰度不够,不建议使用)
 *
 * @param view UIView
 * @return 富文本
 */
+ (NSAttributedString *)attributedStringFromView:(UIView *)view
{
    UIImage *image = [self imageFromView:view];
    return [self attributedStringFromImage:image];
}

/**
 * 将view转换为图片
 *
 * @param view UIView
 * @return 图片
 */
+ (UIImage *)imageFromView:(UIView *)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tImage;
}

#pragma mark ========== 删除线 ==========

/**
 * 添加中间删除线
 *
 * @param range NSRange
 */
- (void)addStrikethroughInRange:(NSRange)range
{
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.3) {
        [self addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle), NSBaselineOffsetAttributeName : @(0)} range:range];
    }else {
        [self addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle)} range:range];
    }
}

/**
 * 添加中间删除线(删除线的颜色自定义)
 *
 @param range NSRange
 @param color UIColor,可以为nil
 */
- (void)addStrikethroughInRange:(NSRange)range withColor:(UIColor *)color
{
    [self addStrikethroughInRange:range];
    if (color) {
        [self addAttributes:@{NSStrikethroughColorAttributeName : color} range:range];
    }
}

#pragma mark ========== 下滑线 ==========

/**
 * 添加下划线(下划线颜色可自定义,也可传nil)
 */
- (void)addUnderLineInRange:(NSRange)range withColor:(UIColor *)color
{
    [self addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    
    if (color) {
        [self addAttributes:@{NSForegroundColorAttributeName : color} range:range];
    }
}

@end
