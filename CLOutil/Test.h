//
//  Test.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cat.h"

@interface Test : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,copy) NSString  *age1;

// 属性是一个对象
@property (nonatomic,strong) Cat*cat;
//// 属性是一个数组
@property (nonatomic,strong) NSArray *books;

@property (nonatomic ,strong) NSString *jfa;


@end
