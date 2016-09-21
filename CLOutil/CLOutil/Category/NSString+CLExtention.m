//
//  NSString+CLExtention.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "NSString+CLExtention.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>


@implementation NSString (CLExtention)

- (NSString *)md5String
{
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)stringFromBytes:(unsigned char *)bytes length:(int)length
{
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}


/**
 *  URLEncoded
 *
 *  @return <#return value description#>
 */
- (NSString *)URLEncodedString
{

    
    //    NSString *result = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!*'();:@&=+$,/?%#[]"]];
    
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    
    
    return result;
}

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *encodedString = self;
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

- (NSString *)chineseToPinYin
{
    NSMutableString *pinyin = [self mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripCombiningMarks, NO);
    
    NSArray *comp = [[pinyin lowercaseString] componentsSeparatedByString:@" "];
    
    return [comp componentsJoinedByString:@""];
}

- (CGSize)textHeightWithMaxSize:(CGSize)size font:(UIFont *)font {
    
    return [self boundingRectWithSize:size
                                   options:NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading |
            NSStringDrawingUsesDeviceMetrics |
            NSStringDrawingTruncatesLastVisibleLine
                                attributes:@{NSFontAttributeName:font}
                                   context:nil].size;
    
}



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
    
    return [predicate evaluateWithObject:self];
    
}









@end
