//
//  UILabel+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CLExtension)

// 计算字体所占的size
- (CGSize)textHeightWithMaxSize:(CGSize)size font:(UIFont *)font;

@end
