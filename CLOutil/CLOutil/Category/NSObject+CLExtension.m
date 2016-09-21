//
//  NSObject+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "NSObject+CLExtension.h"
#import <objc/runtime.h>
#import "CLHelper.h"

@implementation NSObject (CLExtension)



- (void)keyValuesWithObjcet:(NSDictionary *)dict {
    
    Class c = [self class];
    
    unsigned int outCount = 0;
    
    Ivar *ivars = class_copyIvarList([c class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        Ivar ivar = ivars[i];
        NSString *key  = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        key            = [key substringFromIndex:1];
        id value       = nil;
        
        if ([self respondsToSelector:@selector(replaceKeyByValue)]) {
            
            NSArray *replaceKeys = [[self replaceKeyByValue] allKeys];
            
            if ([replaceKeys containsObject:key]) {
                
                value = [dict valueForKey:[[self replaceKeyByValue] objectForKey:key]];
                
            } else {
                
                value = [dict valueForKey:key];
                
            }
            
        } else {
            
            value     = [dict valueForKey:key];
            
        }
        
        if (value == nil) {
            continue;
        }
        
        NSRange range = [type rangeOfString:@"@\""];
        if (range.location != NSNotFound) {
            
            NSInteger length = type.length;
            type             = [type substringWithRange:NSMakeRange(2, length-3)];
            NSSet *set       = [CLHelper foundationClasses];
            // 不是foundation框架下的类 说明是自定义类
            if (![set containsObject:NSClassFromString(type)]) {
                
                Class cl = NSClassFromString(type);
                value    = [cl keyValuesWithDict:value];
                
            }
            // 是foundation框架下的类
            else
            {
                if ([type isEqualToString:NSStringFromClass([NSArray class])]) {
                    
                    NSArray *array       = (NSArray *)value;
                    
                    NSMutableArray *mArr = [[NSMutableArray alloc] init];
                    
                    for (int i = 0; i < [array count]; i++) {
                        
                        if ([self respondsToSelector:@selector(addDictionaryForArrayType)]) {
                            
                            NSArray *keyValues       = [[self addDictionaryForArrayType] allKeys];
                            if ([keyValues containsObject:key]) {
                                
                                NSString *valueClass = [[self addDictionaryForArrayType] objectForKey:key];
                                
                                Class cl = NSClassFromString(valueClass);
                                
                                [mArr addObject:[cl keyValuesWithDict:array[i]]];
                                
                            }
                            
                            value = mArr;
                        }
                        else {
                            
                            [self setValue:value forKeyPath:key];
                            
                        }
                        
                        
                        
                    }
                    [self setValue:value forKeyPath:key];
                }
            }
        }
        // 这不是对象是数值类型
        [self setValue:value forKeyPath:key];
    }
    
    
    free(ivars);
    c = [c superclass];
    
}

+ (id)keyValuesWithDict:(NSDictionary *)dict {
    
    NSObject *object = [[self alloc] init];
    
    [object keyValuesWithObjcet:dict];
    
    return object;
    
}

+ (id)keyValuesWithString:(NSString *)jsonString {

    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonString options:NSJSONWritingPrettyPrinted error:nil];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSObject *object = [[self alloc] init];
    
    [object keyValuesWithObjcet:dict];
    
    return object;
}


+ (id)keyValuesWithData:(NSData *)data {
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSObject *object = [[self alloc] init];
    
    [object keyValuesWithObjcet:dict];
    
    return object;
    
    
}


// 打印出属性的名字
- (NSString *)description {
    
    NSMutableString *resultString = [[NSMutableString alloc] initWithFormat:@"类名:%@",NSStringFromClass([self class])];
    
    NSArray *array = [self getAttributions];
    for (NSString *key in array) {
        id Value = [self valueForKeyPath:key];
        
        [resultString appendFormat:@"\n%@:%@",key,Value];
        
    }
    
    
    return resultString;
    
    
}

/*
 *  归档
 */
- (void)encode:(NSCoder *)code {
    
    NSArray *attribs = [self getAttributions];
    
    for (NSString *key in attribs) {

        id value = [self valueForKeyPath:key];
        
        [code encodeObject:value forKey:key];
        
    }

}


/*
 *  解档
 */
- (void)code:(NSCoder *)encode  {
    
    NSArray *array = [self getAttributions];
    
    for (NSString *key in array) {
    
        id value = [encode decodeObjectForKey:key];
        
        [self setValue:value forKey:key];
        
    }
    
    
    
}


- (NSArray *)getAttributions {
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    Class c = self.class;
    
    while (c && c!= [NSObject class]) {
        unsigned int outCount = 0;
        
        Ivar *ivars = class_copyIvarList(c, &outCount);
        
        for (int i = 0; i < outCount; i++) {
            
            Ivar ivar = ivars[i];
            
            NSString *member = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoreWithAttributions)]) {
                
                if ([[self ignoreWithAttributions] containsObject:member]) {
                    continue;
                }
                
            }
            
            
            [result addObject:member];
            
        }
        
        free(ivars);
        c = [c superclass];
    }
    return [result copy];
}


@end
