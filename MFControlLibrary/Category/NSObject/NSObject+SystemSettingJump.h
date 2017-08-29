//
//  NSObject+SystemSettingJump.h
//  MFWIFIExample
//
//  Created by XuMengFan on 17/6/1.
//  Copyright © 2017年 MF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SystemSettingType) {
    SystemSettingTypeWifi                   = 1, /**< 无线局域网*/
    SystemSettingTypeBluetooth              = 2, /**< 蓝牙*/
    SystemSettingTypeMobileData             = 3, /**< 蜂窝移动网络*/
    SystemSettingTypePersonalHotspot        = 4, /**< 个人热点*/
    SystemSettingTypeCarrier                = 5, /**< 运营商*/
    SystemSettingTypeNotification           = 6, /**< 通知*/
    SystemSettingTypeGeneral                = 7, /**< 通用*/
    SystemSettingTypeAbout                  = 8, /**< 通用-关于本机*/
    SystemSettingTypeKeyboard               = 9, /**< 通用-键盘*/
    SystemSettingTypeAccessibility          = 10,/**< 通用-辅助功能*/
    SystemSettingTypeInternational          = 11,/**< 通用-语言与地区*/
    SystemSettingTypeReset                  = 12,/**< 通用-还原*/
    SystemSettingTypeWallpaper              = 13,/**< 墙纸*/
    SystemSettingTypeSiri                   = 14,/**< Siri*/
    SystemSettingTypePrivacy                = 15,/**< 隐私*/
    SystemSettingTypeSafari                 = 16,/**< Safari*/
    SystemSettingTypeMusic                  = 17,/**< 音乐*/
    SystemSettingTypeMusicEQ                = 18,/**< 音乐-均衡器*/
    SystemSettingTypePhotos                 = 19,/**< 照片与相机*/
    SystemSettingTypeFaceTime               = 20,/**< FaceTime*/
};

@interface NSObject (SystemSettingJump)

+ (void)systemSettingJump:(SystemSettingType)systemSettingType;

+ (void)customSystemSettingJump:(NSString *)url;

@end
