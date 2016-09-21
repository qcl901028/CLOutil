//
//  NSString+CLExtention.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (CLExtention)

/**
 *  md5加密
 *
 *  @return <#return value description#>
 */
- (NSString *)md5String;


/**
 *  urlencodedString URL编码
 *
 *  @return <#return value description#>
 */
- (NSString *)URLEncodedString;


/**
 *  URLDecode URL解码
 */
-(NSString *)URLDecodedString;



/**
 *  中文转化为拼音
 */

- (NSString *)chineseToPinYin;

/**
 *  计算字体所占的size
 */
- (CGSize)textHeightWithMaxSize:(CGSize)size font:(UIFont *)font;







/**
 *  判断是不是手机号码
 *
 *  @param phoneNum <#phoneNum description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_PhoneNum ;

/**
 *  判读是不是固定电话
 *
 *  @param fixedLineTelNum <#fixedLineTelNum description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_FixedLineTelNum;

/**
 *  判断是不是中文名字 2~4 位
 *
 *  @param Chinese <#Chinese description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Chinese ;

/**
 *  判断是不是身份证号码
 *
 *  @param identityCard <#identityCard description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_IdentityCard ;

/**
 *  判断是不是金额
 *
 *  @param amount <#amount description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Amount ;

/**
 *  判断是不是邮箱
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
- (BOOL)regExp_Email;






- (BOOL)regExp_Text:(NSString *)regExp;







@end
