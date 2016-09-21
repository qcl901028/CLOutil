//
//  Name.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLOutilHeaderDefine.h"

@interface Name : NSObject

Singleton_interface(Name);

@property (nonatomic, assign) NSInteger name;

- (void)eat;

@end
