//
//  CLDictionaryToJson.m
//  12
//
//  Created by MAC_PRO on 16/9/10.
//  Copyright © 2016年 Boy. All rights reserved.
//

#import "CLDictionaryToJson.h"


@interface CLDictionaryToJson ()


@property (nonatomic, strong) NSMutableString *resultString;


@end

@implementation CLDictionaryToJson



+ (NSString *)jsonStringWithDict:(NSDictionary *)dict {
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict options:kNilOptions error:nil];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _resultString = [[NSMutableString alloc] init];

        
    }
    return self;
}

- (NSString *)jsonStringByDictionary:(NSDictionary *)dict {
    
    
    NSInteger flag = 0;
    for (NSString *key in [dict allKeys]) {
        
        
        if ([[dict objectForKey:key] isKindOfClass:[NSDictionary class]]) {
           
            
            [_resultString appendFormat:@"\"%@\":{",key];
            [self jsonStringByDictionary:[dict objectForKey:key]];
            flag ++;
            
            
        }
       
        
        if ([[dict objectForKey:key] isKindOfClass:[NSString class]]) {
            
            [_resultString appendFormat:@"\"%@\":\"%@\",",key,[dict objectForKey:key]];
        }
    }
    
    
    [_resultString appendString:@"}"];
    
    
    NSString *string = [@"{" stringByAppendingString:_resultString];
    
    
    
    NSRange range = [string rangeOfString:@",}"];
    
    NSMutableString *str = [string mutableCopy];
    
    while (range.location != NSNotFound) {
        
        [str replaceCharactersInRange:NSMakeRange(range.location, 2) withString:@"},"];
        
        range = [str rangeOfString:@",}"];
        
    }
    
    
    return [str substringToIndex:str.length - 1];
    
}



@end
