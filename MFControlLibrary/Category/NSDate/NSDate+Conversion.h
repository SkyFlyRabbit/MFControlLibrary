//
//  NSDate+Conversion.h
//  Pods
//
//  Created by XuMengFan on 2017/7/25.
//
//

#import <Foundation/Foundation.h>

/**
 * 设置日期年月日格式(yyyy-MM-dd)
 */
typedef NS_ENUM(NSInteger, NSDateFormatPrefixType) {
    NSDateFormatPrefixTypeUndefine        = 1,
    
    NSDateFormatPrefixTypeYear            = 2,
    NSDateFormatPrefixTypeMonth           = 3,
    NSDateFormatPrefixTypeDay             = 4,
    
    NSDateFormatPrefixTypeYearMonth       = 5,
    NSDateFormatPrefixTypeYearDay         = 6,
    NSDateFormatPrefixTypeMonthDay        = 7,
    
    NSDateFormatPrefixTypeYearMonthDay    = 8,
};

/**
 * 设置日期时分秒格式(HH:mm:ss)
 */
typedef NS_ENUM(NSInteger, NSDateFormatSuffixType) {
    NSDateFormatSuffixTypeUndefine              = 1,
    
    NSDateFormatSuffixTypeHour                  = 2,
    NSDateFormatSuffixTypeMinute                = 3,
    NSDateFormatSuffixTypeSecond                = 4,
    
    NSDateFormatSuffixTypeHourMinute            = 5,
    NSDateFormatSuffixTypeHourSecond            = 6,
    NSDateFormatSuffixTypeMinuteSecond          = 7,
    
    NSDateFormatSuffixTypeHourMinuteSecond      = 8,
};

@interface NSDate (Conversion)

/**
 * 将NSDate转换为NSString
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)dateFromat;

/**
 * 将NSString转换为NSDate
 */
+ (NSDate *)dateFromSting:(NSString *)string withFormat:(NSString *)dateFromat;

/**
 * 获取日期转换格式
 *
 * @param dateFormatPrefixType 年月日格式
 * @param dateFormatSuffixType 时分秒格式
 * @return @(NSString)
 */
+ (NSString *)getDateFormatWithPrefixType:(NSDateFormatPrefixType)dateFormatPrefixType
                               suffixType:(NSDateFormatSuffixType)dateFormatSuffixType;

@end
