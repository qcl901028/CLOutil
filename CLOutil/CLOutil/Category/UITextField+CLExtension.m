//
//  UITextField+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "UITextField+CLExtension.h"

@implementation UITextField (CLExtension)


/**
 *  判断是不是手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_PhoneNum {
    
    NSString *regExp = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    return [self regExp_Text:regExp];
}

/**
 *  判读是不是固定电话
 *
 *  @param fixedLineTelNum <#fixedLineTelNum description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_FixedLineTelNum {
    
    NSString *regExp = @"(\\(\\d{3,4}\\)|\\d{3,4}-|\\s)?\\d{8}";
    
    return [self regExp_Text:regExp];
    
}

/**
 *  判断是不是中文名字 2~4 位
 *
 *  @param Chinese <#Chinese description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Chinese {
    
    NSString *regExp = @"[\u4e00-\u9fa5]{2,4}";
    
    return [self regExp_Text:regExp];
    
}

/**
 *  判断是不是身份证号码
 *
 *  @param identityCard <#identityCard description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_IdentityCard {
    
    NSString *regExp = @"[1-6][0-7][\\d]{4}((19[\\d]{2})|(20[0-1][\\d]))((0[1-9])|(1[0-2]))((0[1-9])|([1-2]\\d)|(3[0-1]))[\\d]{3}[\\dx]";
    
    return [self regExp_Text:regExp];
    
}

/**
 *  判断是不是金额
 *
 *  @param amount <#amount description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Amount {
    
    NSString *regExp = @"^[0-9]+(.[0-9]{1,2})?$";
    
    return [self regExp_Text:regExp];
    
}

/**
 *  判断是不是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Email {
    
    NSString *regExp = @"^(([_\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([_\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?))$";
    
    return [self regExp_Text:regExp];
    
}






- (BOOL)regExp_Text:(NSString *)regExp {
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp];
    
    return [predicate evaluateWithObject:self.text];
    
}






@end
