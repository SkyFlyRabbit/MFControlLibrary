//
//  MFAlterView.m
//  Pods
//
//  Created by XuMengFan on 2017/7/10.
//
//

#import "MFAlterView.h"

#import <objc/runtime.h>

@interface UIAlertController ()

@property (nonatomic, strong) UIWindow *window;

@end

@implementation UIAlertController (cumstom)

- (void)setWindow:(UIWindow *)window
{
    objc_setAssociatedObject(self, _cmd, window, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIWindow *)window
{
    UIWindow *window = objc_getAssociatedObject(self, _cmd);
    if (!window) {
        window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.windowLevel = CGFLOAT_MAX;
        window.rootViewController = [[UIViewController alloc] init];
        window.hidden = YES;
        objc_setAssociatedObject(self, _cmd, window, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return window;
}

- (void)beginShow
{
    self.window.hidden = NO;
    [self.window.rootViewController presentViewController:self animated:YES completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.window.hidden = YES;
    self.window = nil;
}

@end

@implementation MFAlterView

+ (void)showAlertWithTitle:(NSString * _Nullable)title
                   message:(NSString * _Nullable)message
          buttonTitleArray:(NSArray<NSString *> * _Nullable)buttonTitleArray
                   handler:(void (^ __nullable)(NSInteger index))handler
{
    UIAlertController *alterVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSString *buttonTitle in buttonTitleArray) {
        UIAlertAction *alterAction = [UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                NSInteger index = [buttonTitleArray indexOfObject:buttonTitle];
                handler(index);
            }
        }];
        [alterVC addAction:alterAction];
    }
    [alterVC beginShow];
}

@end
