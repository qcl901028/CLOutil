//
//  CLRegExp.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "CLRegExp.h"

@implementation CLRegExp

/**
 *  判断是不是手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_PhoneNum:(NSString *)phoneNum {
    
    NSString *regExp = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    
    return [self regExp_Text:regExp contentString:phoneNum];
}

/**
 *  判断是不是移动手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaMobile:(NSString *)phoneNum {
    
    NSString *regExp = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\\\d|705)\\\\d{7}$";
    
    return [self regExp_Text:regExp contentString:phoneNum];
}

//China telecom 中国电信
/**
 *  电信号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaTelecom:(NSString *)phoneNum {
    
    NSString *regExp = @"^1((33|53|8[09])\\\\d|349|700)\\\\d{7}$";
    
    return [self regExp_Text:regExp contentString:phoneNum];
}

//Unicom
/**
 *  中国联通号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaUnicom:(NSString *)phoneNum {
    
    NSString *regExp = @"^1((3[0-2]|5[256]|8[56])\\\\d|709)\\\\d{7}$";
    
    return [self regExp_Text:regExp contentString:phoneNum];
}

/**
 *  大陆地区固话及小灵通
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_fixed_lineOrPHS:(NSString *)phoneNum {
    
    NSString *regExp = @"^0(10|2[0-5789]|\\\\d{3})\\\\d{7,8}$";
    
    return [self regExp_Text:regExp contentString:phoneNum];
}




/**
 *  判读是不是固定电话
 *
 *  @param fixedLineTelNum <#fixedLineTelNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_FixedLineTelNum:(NSString *)fixedLineTelNum {
    
    NSString *regExp = @"(\\(\\d{3,4}\\)|\\d{3,4}-|\\s)?\\d{8}";
    
    return [self regExp_Text:regExp contentString:fixedLineTelNum];
    
}




/**
 *  判断是不是中文名字 2~4 位
 *
 *  @param Chinese <#Chinese description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Chinese:(NSString *)Chinese {
    
    NSString *regExp = @"[\u4e00-\u9fa5]{2,4}";
    
    return [self regExp_Text:regExp contentString:Chinese];
    
}

/**
 *  判断是不是身份证号码
 *
 *  @param identityCard <#identityCard description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_IdentityCard:(NSString *)identityCard {
    
    NSString *regExp = @"[1-6][0-7][\\d]{4}((19[\\d]{2})|(20[0-1][\\d]))((0[1-9])|(1[0-2]))((0[1-9])|([1-2]\\d)|(3[0-1]))[\\d]{3}[\\dx]";
    
    return [self regExp_Text:regExp contentString:identityCard];
    
}

/**
 *  判断是不是金额
 *
 *  @param amount <#amount description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Amount:(NSString *)amount {
    
    NSString *regExp = @"^[0-9]+(.[0-9]{1,2})?$";
    
    return [self regExp_Text:regExp contentString:amount];
    
}

/**
 *  判断是不是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Email:(NSString *)email {
    
    NSString *regExp = @"^(([_\\w-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([_\\w-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?))$";
    
    return [self regExp_Text:regExp contentString:email];
    
}


/**
 *  邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Url:(NSString *)Url {
    
    NSString *regExp = @"\\\\b((ftp|http|https?):\\\\/\\\\/[-\\\\w]+(\\\\.\\\\w[-\\\\w]*)+|(?i:[a-z0-9](?:[-a-z0-9]*[a-z0-9])?\\\\.)+(?-i:com\\\\b|edu\\\\b|biz\\\\b|gov\\\\b|in(?:t|fo)\\\\b|mil\\\\b|net\\\\b|org\\\\b|[a-z][a-z]\\\\b))(:\\\\d+)?(/[^.!,?;\\\"'<>()\\\\[\\\\]{}\\\\s\\\\x7F-\\\\xFF]*(?:[.!,?]+[^.!,?;\\\"'<>()\\\\[\\\\]{}\\\\s\\\\x7F-\\\\xFF]+)*)?";
    
    return [self regExp_Text:regExp contentString:Url];
    
}

/**
 *  车型
 *
 *  @param CarType <#CarType description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_CarType:(NSString *)CarType {
    
    NSString *regExp = @"^[\\u4E00-\\u9FFF]+$";
    
    return [self regExp_Text:regExp contentString:CarType];
    
}

/**
 *  车牌号码
 *
 *  @param CarNumber <#CarNumber description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_CarNumber:(NSString *)CarNumber {
    //车牌号:湘K-DE829 香港车牌号码:粤Z-J499港
    NSString *regExp = @"^[\\u4e00-\\u9fff]{1}[a-zA-Z]{1}[-][a-zA-Z_0-9]{4}[a-zA-Z_0-9_\\u4e00-\\u9fff]$";//其中\\u4e00-\\u9fa5表示unicode编码中汉字已编码部分，\\u9fa5-\\u9fff是保留部分，将来可能会添加
    return [self regExp_Text:regExp contentString:CarNumber];
}

/**
 *  IP地址
 *
 *  @param IPAddress <#IPAddress description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_IPAddress:(NSString *)IPAddress {
    NSString *regExp = [NSString stringWithFormat:@"^(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})\\\\.(\\\\d{1,3})$"];
    BOOL rc = [self regExp_Text:regExp contentString:IPAddress];
    
    if (rc) {
        NSArray *componds = [IPAddress componentsSeparatedByString:@","];
        
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        
        return v;
    }
    
    return NO;
}

/**
 *  邮政编码
 *
 *  @param Postalcode <#Postalcode description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Postalcode:(NSString *)Postalcode {
    NSString *postalRegex = @"^[0-8]\\\\d{5}(?!\\\\d)$";
    return [self regExp_Text:postalRegex contentString:Postalcode];
}

+ (BOOL)regExp_TaxNo:(NSString *)TaxNo {
    
    NSString *regExp = @"[0-9]\\\\d{13}([0-9]|X)$";
    return [self regExp_Text:regExp contentString:TaxNo];
}


+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value {
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value) {
        return NO;
    }else {
        length = (int)value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}


/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
+ (BOOL)wl_bankCardluhmCheck:(NSString *)bankCardluhm{
    NSString * lastNum = [[bankCardluhm substringFromIndex:(bankCardluhm.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[bankCardluhm substringToIndex:(bankCardluhm.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}


+ (BOOL)regExp_Text:(NSString *)regExp contentString:(NSString *)contentString {
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regExp];
    
    return [predicate evaluateWithObject:contentString];
    
}


@end
