//
//  NSArray+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "NSArray+CLExtension.h"
#import "NSString+CLExtention.h"

@implementation NSArray (CLExtension)


/**
 *  比较字符串并排序 < 升序
 */

- (NSArray *)compareResultAscending{
    
  NSArray *resultArr = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {

      return [obj1 compare:obj2] == NSOrderedAscending;
      
    }];
    
    return resultArr;
}


/**
 *  比较字符串并排序 > 降序
 */

- (NSArray *)compareResultDescending{
    
    NSArray *resultArr = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        return [obj1 compare:obj2] == NSOrderedDescending;
        
    }];
    
    return resultArr;
}



- (NSArray *)chineseToPinYin {
    
    NSMutableArray *resultArr = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        NSString *string = obj;
        
       [resultArr addObject:[string chineseToPinYin]];
        
        
    }];
    
    return resultArr;
    
}

@end
