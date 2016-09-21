//
//  CLDictionaryToJson.h
//  12
//
//  Created by MAC_PRO on 16/9/10.
//  Copyright © 2016年 Boy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLDictionaryToJson : NSObject



- (NSString *)jsonStringByDictionary:(NSDictionary *)dict NS_AVAILABLE(9_0, 5_0);


/**
 *  字典转json字符串 没有空格
 *
 *  @param dict
 *
 *  @return
 */
+ (NSString *)jsonStringWithDict:(NSDictionary *)dict;



@end
