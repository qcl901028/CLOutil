//
//  UITextView+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/19.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "UITextView+CLExtension.h"

@implementation UITextView (CLExtension)

// 计算字体所占的size
- (CGFloat)textHeightWithMaxSize:(CGFloat)width font:(UIFont *)font {
    
    CGFloat He = self.textContainerInset.left +
                   self.textContainerInset.right+
                         self.contentInset.left +
                         self.contentInset.right+
                         self.textContainer.lineFragmentPadding*2;
    
    
    CGFloat va = self.textContainerInset.top + self.textContainerInset.bottom+self.contentInset.bottom + self.contentInset.top ;
    
    
    CGSize result = [self.text boundingRectWithSize:CGSizeMake(width - He, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin |
                     NSStringDrawingUsesFontLeading |
                     NSStringDrawingUsesDeviceMetrics |
                     NSStringDrawingTruncatesLastVisibleLine
                                         attributes:@{NSFontAttributeName:font}
                                            context:nil].size;
    
    return result.height + va;
}


@end
