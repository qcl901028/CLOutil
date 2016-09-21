//
//  UITextView+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/19.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (CLExtension)


// 计算字体所占的size
- (CGFloat)textHeightWithMaxSize:(CGFloat)width font:(UIFont *)font;

@end
