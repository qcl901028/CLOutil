//
//  NSDictionary+CLKeyValue.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CLKeyValue)

/**
 *  把字典转化为json字符串
 *
 *  @param jsonString 回调的字符串
 *  @param error      如果转化错误 讲返回错误信息
 */
- (void)jsonString:(void(^)(NSString *jsonString))jsonString error:(void(^)(NSError *error))error;

@end
