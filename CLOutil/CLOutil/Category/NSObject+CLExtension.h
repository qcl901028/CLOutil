//
//  NSObject+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (CLExtension)


//忽略某个属性
- (NSArray *)ignoreWithAttributions;


// 得到所有的属性
- (NSArray *)getAttributions;

/*
 *  自定义类的归档
 */
- (void)encode:(NSCoder *)code;


/*
 *  自定义类的解档
 */
- (void)code:(NSCoder *)encode;



/*=====================  字典转模型(NSDictionary、NSString、NSData)  =======================*/

/*
 * 字典转模型
 */

+ (id)keyValuesWithDict:(NSDictionary *)dict;

/*
 * 如果value 是个数组 需要设置；
 */
- (NSDictionary*)addDictionaryForArrayType;

/*
 * json字符串 转化模型
 */
+ (id)keyValuesWithString:(NSString *)jsonString;


/*
 * json二进制数据 转化模型
 */

+ (id)keyValuesWithData:(NSData *)data;

/*
 * 如果有名字和官方的名字重复命名时  可以用这个方法以key Value 的方式进行替换@{@"description":@"value"}
 */
- (NSDictionary *)replaceKeyByValue;


@end
