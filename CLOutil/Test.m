//
//  Test.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "Test.h"
#import "NSObject+CLExtension.h"
#import "CLOutil.h"

@interface Test ()<NSCoding>



@end

@implementation Test

//归档方法的实现
CodingImplementation;


- (NSDictionary *)addDictionaryForArrayType {
    
    return @{@"books":@"Book"};
    
}

- (NSDictionary *)replaceKeyByValue {
    
    
    return @{@"age1":@"age"};
}

//- (NSArray *)ignoreWithAttributions {
//    
//    return @[@"_name",@"_students"];
//}









@end
