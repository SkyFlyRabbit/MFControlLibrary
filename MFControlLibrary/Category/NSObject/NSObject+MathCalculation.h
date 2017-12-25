//
//  NSObject+MathCalculation.h
//  Pods
//
//  Created by XuMengFan on 2017/8/30.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (MathCalculation)

#pragma mark ========== 截取 整数/小数部分数值 ==========

/**
 * 获取数字num的小数部分数值
 */
+ (double)decimalPartOfDoubleNum:(double)num;

/**
 * 获取数字num的整数部分数值
 */
+ (double)integerPartOfDoubleNum:(double)num;

@end
