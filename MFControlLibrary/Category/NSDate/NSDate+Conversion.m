//
//  NSDate+Conversion.m
//  Pods
//
//  Created by XuMengFan on 2017/7/25.
//
//

#import "NSDate+Conversion.h"

@implementation NSDate (Conversion)

#pragma mark - public && NSString and NSDate convert each other

/**
 * 将NSDate转换为NSString
 */
+ (NSString *)stringFromDate:(NSDate *)date withFormat:(NSString *)dateFromat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFromat];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *timeStr = [formatter stringFromDate:date];
    return timeStr;
}

/**
 * 将NSString转换为NSDate
 */
+ (NSDate *)dateFromSting:(NSString *)string withFormat:(NSString *)dateFromat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFromat];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    NSDate *timeDate = [formatter dateFromString:string];
    return timeDate;
}

/**
 * 获取日期转换格式
 *
 * @param dateFormatPrefixType 年月日格式
 * @param dateFormatSuffixType 时分秒格式
 * @return @(NSString)
 */
+ (NSString *)getDateFormatWithPrefixType:(NSDateFormatPrefixType)dateFormatPrefixType
                               suffixType:(NSDateFormatSuffixType)dateFormatSuffixType
{
    NSString *prefixStr = [self getFormatWithDateFormatPrefixType:dateFormatPrefixType];
    NSString *suffixStr = [self getFormatWithDateFormatSuffixType:dateFormatSuffixType];
    
    NSMutableString *formatStr = [[NSMutableString alloc] initWithString:@""];
    if (prefixStr && prefixStr.length > 0) {
        [formatStr appendString:prefixStr];
    }
    if (suffixStr && suffixStr.length > 0) {
        [formatStr appendString:[NSString stringWithFormat:@" %@", suffixStr]];
    }
    return formatStr;
}

#pragma mark - private && get dateFormat

+ (NSString *)getFormatWithDateFormatPrefixType:(NSDateFormatPrefixType)dateFormatPrefixType
{
    NSString *prefixStr = nil;
    switch (dateFormatPrefixType) {
        case NSDateFormatPrefixTypeUndefine:
            prefixStr = nil;
            break;
        case NSDateFormatPrefixTypeYear:
            prefixStr = @"yyyy";
            break;
        case NSDateFormatPrefixTypeMonth:
            prefixStr = @"MM";
            break;
        case NSDateFormatPrefixTypeDay:
            prefixStr = @"dd";
            break;
        case NSDateFormatPrefixTypeYearMonth:
            prefixStr = @"yyyy-MM";
            break;
        case NSDateFormatPrefixTypeYearDay:
            prefixStr = @"yyyy-dd";
            break;
        case NSDateFormatPrefixTypeMonthDay:
            prefixStr = @"MM-dd";
            break;
        case NSDateFormatPrefixTypeYearMonthDay:
            prefixStr = @"yyyy-MM-dd";
            break;
        default:
            break;
    }
    return prefixStr;
}

+ (NSString *)getFormatWithDateFormatSuffixType:(NSDateFormatSuffixType)dateFormatSuffixType
{
    NSString *suffixStr = nil;
    switch (dateFormatSuffixType) {
        case NSDateFormatSuffixTypeUndefine:
            suffixStr = nil;
            break;
        case NSDateFormatSuffixTypeHour:
            suffixStr = @"HH";
            break;
        case NSDateFormatSuffixTypeMinute:
            suffixStr = @"mm";
            break;
        case NSDateFormatSuffixTypeSecond:
            suffixStr = @"ss";
            break;
        case NSDateFormatSuffixTypeHourMinute:
            suffixStr = @"HH:mm";
            break;
        case NSDateFormatSuffixTypeHourSecond:
            suffixStr = @"HH:ss";
            break;
        case NSDateFormatSuffixTypeMinuteSecond:
            suffixStr = @"mm:ss";
            break;
        case NSDateFormatSuffixTypeHourMinuteSecond:
            suffixStr = @"HH:mm:ss";
            break;
        default:
            break;
    }
    return suffixStr;
}

@end
