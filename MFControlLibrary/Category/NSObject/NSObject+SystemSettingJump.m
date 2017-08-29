//
//  NSObject+SystemSettingJump.m
//  MFWIFIExample
//
//  Created by XuMengFan on 17/6/1.
//  Copyright © 2017年 MF. All rights reserved.
//

#import "NSObject+SystemSettingJump.h"

/*
无线局域网 App-Prefs:root=WIFI

蓝牙 App-Prefs:root=Bluetooth

蜂窝移动网络 App-Prefs:root=MOBILE_DATA_SETTINGS_ID

个人热点 App-Prefs:root=INTERNET_TETHERING

运营商 App-Prefs:root=Carrier

通知 App-Prefs:root=NOTIFICATIONS_ID

通用 App-Prefs:root=General

通用-关于本机 App-Prefs:root=General&path=About

通用-键盘 App-Prefs:root=General&path=Keyboard

通用-辅助功能 App-Prefs:root=General&path=ACCESSIBILITY

通用-语言与地区 App-Prefs:root=General&path=INTERNATIONAL

通用-还原 App-Prefs:root=Reset

墙纸 App-Prefs:root=Wallpaper

Siri App-Prefs:root=SIRI

隐私 App-Prefs:root=Privacy

Safari App-Prefs:root=SAFARI

音乐 App-Prefs:root=MUSIC

音乐-均衡器 App-Prefs:root=MUSIC&path=com.apple.Music:EQ

照片与相机 App-Prefs:root=Photos

FaceTime App-Prefs:root=FACETIME
*/

@implementation NSObject (SystemSettingJump)

#pragma mark - public

+ (void)customSystemSettingJump:(NSString *)url
{
    [self jumpSystemSettingWithUrl:url];
}

+ (void)systemSettingJump:(SystemSettingType)systemSettingType
{
    NSString *url = [self getUrlWithSystemSettingType:systemSettingType];
    [self customSystemSettingJump:url];
}

#pragma mark - private

+ (NSString *)getUrlWithSystemSettingType:(SystemSettingType)systemSettingType
{
    NSString *prefix = @"App-Prefs:root=";
    NSString *suffix = @"";
    switch (systemSettingType) {
        case SystemSettingTypeWifi:
            suffix = @"WIFI";
            break;
        case SystemSettingTypeBluetooth:
            suffix = @"Bluetooth";
            break;
        case SystemSettingTypeMobileData:
            suffix = @"MOBILE_DATA_SETTINGS_ID";
            break;
        case SystemSettingTypePersonalHotspot:
            suffix = @"INTERNET_TETHERING";
            break;
        case SystemSettingTypeCarrier:
            suffix = @"Carrier";
            break;
        case SystemSettingTypeNotification:
            suffix = @"NOTIFICATIONS_ID";
            break;
        case SystemSettingTypeGeneral:
            suffix = @"General";
            break;
        case SystemSettingTypeAbout:
            suffix = @"General&path=About";
            break;
        case SystemSettingTypeKeyboard:
            suffix = @"General&path=Keyboard";
            break;
        case SystemSettingTypeAccessibility:
            suffix = @"General&path=ACCESSIBILITY";
            break;
        case SystemSettingTypeInternational:
            suffix = @"General&path=INTERNATIONAL";
            break;
        case SystemSettingTypeReset:
            suffix = @"Reset";
            break;
        case SystemSettingTypeWallpaper:
            suffix = @"Wallpaper";
            break;
        case SystemSettingTypeSiri:
            suffix = @"SIRI";
            break;
        case SystemSettingTypePrivacy:
            suffix = @"Privacy";
            break;
        case SystemSettingTypeSafari:
            suffix = @"SAFARI";
            break;
        case SystemSettingTypeMusic:
            suffix = @"MUSIC";
            break;
        case SystemSettingTypeMusicEQ:
            suffix = @"MUSIC&path=com.apple.Music:EQ";
            break;
        case SystemSettingTypePhotos:
            suffix = @"Photos";
            break;
        case SystemSettingTypeFaceTime:
            suffix = @"FACETIME";
            break;
        default:
            break;
    }
    return [prefix stringByAppendingString:suffix];
}

+ (void)jumpSystemSettingWithUrl:(NSString *)urlString
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlString]]) {
        
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
            
        } else {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
            
        }
    }
}

@end
