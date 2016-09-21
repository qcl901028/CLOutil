//
//  CLRegExp.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLRegExp : NSObject

/**
 *  判断是不是手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_PhoneNum:(NSString *)phoneNum;

/**
 *  判断是不是移动手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaMobile:(NSString *)phoneNum ;

//China telecom 中国电信
/**
 *  电信号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaTelecom:(NSString *)phoneNum ;

//Unicom
/**
 *  中国联通号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_chinaUnicom:(NSString *)phoneNum ;

/**
 *  大陆地区固话及小灵通
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_fixed_lineOrPHS:(NSString *)phoneNum ;




/**
 *  判读是不是固定电话
 *
 *  @param fixedLineTelNum <#fixedLineTelNum description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_FixedLineTelNum:(NSString *)fixedLineTelNum ;




/**
 *  判断是不是中文名字 2~4 位
 *
 *  @param Chinese <#Chinese description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Chinese:(NSString *)Chinese ;

/**
 *  判断是不是身份证号码
 *
 *  @param identityCard <#identityCard description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_IdentityCard:(NSString *)identityCard ;

/**
 *  判断是不是金额
 *
 *  @param amount <#amount description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Amount:(NSString *)amount ;

/**
 *  判断是不是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Email:(NSString *)email ;


/**
 *  邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Url:(NSString *)Url ;

/**
 *  车型
 *
 *  @param CarType <#CarType description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_CarType:(NSString *)CarType ;

/**
 *  车牌号码
 *
 *  @param CarNumber <#CarNumber description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_CarNumber:(NSString *)CarNumber ;

/**
 *  IP地址
 *
 *  @param IPAddress <#IPAddress description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_IPAddress:(NSString *)IPAddress ;

/**
 *  邮政编码
 *
 *  @param Postalcode <#Postalcode description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Postalcode:(NSString *)Postalcode ;

/**
 *  工商税号
 *
 *  @param TaxNo <#TaxNo description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_TaxNo:(NSString *)TaxNo ;

/**
 *  身份证的精确判断
 *
 *  @param value <#value description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value ;


/** 银行卡号有效性问题Luhn算法
 *  现行 16 位银联卡现行卡号开头 6 位是 622126～622925 之间的，7 到 15 位是银行自定义的，
 *  可能是发卡分行，发卡网点，发卡序号，第 16 位是校验码。
 *  16 位卡号校验位采用 Luhm 校验方法计算：
 *  1，将未带校验位的 15 位卡号从右依次编号 1 到 15，位于奇数位号上的数字乘以 2
 *  2，将奇位乘积的个十位全部相加，再加上所有偶数位上的数字
 *  3，将加法和加上校验位能被 10 整除。
 */
+ (BOOL)wl_bankCardluhmCheck:(NSString *)bankCardluhm;

/**
 *  正则表达式的验证
 *
 *  @param regExp        <#regExp description#>
 *  @param contentString <#contentString description#>
 *
 *  @return <#return value description#>
 */
+ (BOOL)regExp_Text:(NSString *)regExp contentString:(NSString *)contentString ;

@end
