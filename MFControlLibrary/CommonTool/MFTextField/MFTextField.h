//
//  MFTextField.h
//  Pods
//
//  Created by XuMengFan on 2017/8/29.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MFTextFieldRule) {
    MFTextFieldRuleOnlyNum      = 1,/**< 纯数字*/
    MFTextFieldRuleOnlyLetter   = 2,/**< 纯字母*/
    MFTextFieldRuleNumAndLetter = 3,/**< 纯(数字+字母)*/
    MFTextFieldRuleOnlyChinese  = 4,/**< 纯汉字*/
};

@protocol MFTextFieldExtendProtocol <NSObject>

@optional

- (BOOL)textFieldShouldClearWhenClickClearButton;

- (BOOL)textFieldShouldReturnWhenClickReturnButton;

@end

@interface MFTextField : UITextField

@property (nonatomic, assign) BOOL pasteEnabled;/**< 粘贴,默认NO,禁止粘贴*/
@property (nonatomic, assign) BOOL selectEnabled;/**< 选择,默认NO,禁止选择*/
@property (nonatomic, assign) BOOL selectAllEnabled;/**< 全选,默认NO,禁止全选*/

@property (nonatomic, assign) NSInteger minLength;/**< 最短长度,默认0*/
@property (nonatomic, assign) NSInteger maxLength;/**< 最大长度,默认NSIntegerMax*/
@property (nonatomic, copy  ) NSString  *rule;/**< 过滤规则(比如只能输入字母,数字文字等),默认为nil*/

@property (nonatomic, weak) id<MFTextFieldExtendProtocol> extendDelegate;

- (NSString *)ruleFormMFTextFieldRuleType:(MFTextFieldRule)rule;

@end
