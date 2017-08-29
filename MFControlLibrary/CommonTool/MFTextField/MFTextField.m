//
//  MFTextField.m
//  Pods
//
//  Created by XuMengFan on 2017/8/29.
//
//

#import "MFTextField.h"

@interface MFTextField ()<UITextFieldDelegate>


@end

@implementation MFTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
        self.minLength = 0;
        self.maxLength = NSIntegerMax;
        self.rule = nil;
    }
    return self;
}
#pragma mark ========== 禁止粘贴/选择/全选 ==========

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) && self.pasteEnabled == NO){//禁止粘贴
        return NO;
    }
    if (action == @selector(select:) && self.selectEnabled == NO){//禁止选择
        return NO;
    }
    if (action == @selector(selectAll:) && self.selectAllEnabled == NO){//禁止全选
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

#pragma mark ========== UITextFieldDelegate ==========

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (newString.length < self.minLength || newString.length > self.maxLength) {
        return NO;
    }
    
    if (newString.length > 0) {
        if (self.rule && self.rule.length > 0) {
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:self.rule options:0 error:NULL];
            NSTextCheckingResult *match = [regex firstMatchInString:newString options:0 range:NSMakeRange(0, [newString length])];
            if (!match) {
                return NO;
            }
        }
    }
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if (self.extendDelegate && [self.extendDelegate respondsToSelector:@selector(textFieldShouldClearWhenClickClearButton)]) {
        return [self.extendDelegate textFieldShouldClearWhenClickClearButton];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.extendDelegate && [self.extendDelegate respondsToSelector:@selector(textFieldShouldReturnWhenClickReturnButton)]) {
        return [self.extendDelegate textFieldShouldReturnWhenClickReturnButton];
    }
    return YES;
}

#pragma mark ========== 过滤规则 ==========

- (NSString *)ruleFormMFTextFieldRuleType:(MFTextFieldRule)rule
{
    NSString *ruleDes = nil;
    switch (rule) {
        case MFTextFieldRuleOnlyNum:
            ruleDes = nil;
            break;
        case MFTextFieldRuleOnlyLetter:
            ruleDes = nil;
            break;
        case MFTextFieldRuleNumAndLetter:
            ruleDes = nil;
            break;
        case MFTextFieldRuleOnlyChinese:
            ruleDes = nil;
            break;
        default:
            break;
    }
    return ruleDes;
}

@end
