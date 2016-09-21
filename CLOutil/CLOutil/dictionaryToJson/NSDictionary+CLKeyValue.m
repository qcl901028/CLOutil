//
//  NSDictionary+CLKeyValue.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "NSDictionary+CLKeyValue.h"

@implementation NSDictionary (CLKeyValue)

- (void)jsonString:(void(^)(NSString *jsonString))jsonString error:(void(^)(NSError *error))error {
    
    NSError *err = nil;
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&err];
    
    if (err == nil) {
        
        if (jsonString) {
            
            jsonString([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            
        }
        
    } else {
        
        if (error) {
            error(err);
        } 
        
    }
    
}






@end
