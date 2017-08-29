//
//  MFAlterView.h
//  Pods
//
//  Created by XuMengFan on 2017/7/10.
//
//

#import <Foundation/Foundation.h>

@interface MFAlterView : NSObject

+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
          buttonTitleArray:(NSArray<NSString *> * _Nullable)buttonTitleArray
                   handler:(void (^ __nullable)(NSInteger index))handler;

@end
   
