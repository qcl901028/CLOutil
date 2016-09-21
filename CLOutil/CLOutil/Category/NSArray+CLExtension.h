//
//  NSArray+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (CLExtension)


/**
 *  比较字符串并排序 < 升序
 */

- (NSArray *)compareResultAscending;


/**
 *  比较字符串并排序 > 降序
 */

- (NSArray *)compareResultDescending;

/**
 *  中文数组 --> 拼音数组
 *
 *  @return <#return value description#>
 */
- (NSArray *)chineseToPinYin;

@end
