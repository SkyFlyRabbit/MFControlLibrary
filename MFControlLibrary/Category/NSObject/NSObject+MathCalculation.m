//
//  NSObject+MathCalculation.m
//  Pods
//
//  Created by XuMengFan on 2017/8/30.
//
//

#import "NSObject+MathCalculation.h"

@implementation NSObject (MathCalculation)

#pragma mark ========== 截取 整数/小数部分数值 ==========

/**
 * 获取数字num的小数部分数值
 */
+ (double)decimalPartOfDoubleNum:(double)num
{
    double integerPartValue;
    double decimalPartValue = modf(num, &integerPartValue);
    return decimalPartValue;
}

/**
 * 获取数字num的整数部分数值
 */
+ (double)integerPartOfDoubleNum:(double)num
{
    double integerPartValue;
    modf(num, &integerPartValue);
    return integerPartValue;
}

#pragma mark ========== 向 下/上取整数值 ==========

+ (double)upIntegerValueOfDoubleNum:(double)num
{
    double upIntegerValue = ceil(num);
    return upIntegerValue;
}

+ (double)douwnIntegerValueOfDoubleNum:(double)num
{
    double upIntegerValue = floor(num);
    return upIntegerValue;
}

@end
