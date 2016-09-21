//
//  Name.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "Name.h"

@interface Name ()



@end

@implementation Name

Singleton_implementation(Name);



-(void)eat {
    
    NSLog(@"%ld",self.name);
    
}

@end
