//
//  Cat.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fish.h"
@interface Cat : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) double price;
// 属性是一个对象
@property (nonatomic,strong) Fish *fish;


@end
