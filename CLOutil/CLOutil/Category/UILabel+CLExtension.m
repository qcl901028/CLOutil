//
//  UILabel+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/18.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "UILabel+CLExtension.h"

@implementation UILabel (CLExtension)

// 计算字体所占的size
- (CGSize)textHeightWithMaxSize:(CGSize)size font:(UIFont *)font {
    
    return [self.text boundingRectWithSize:size
                              options:NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading |
            NSStringDrawingUsesDeviceMetrics |
            NSStringDrawingTruncatesLastVisibleLine
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
    
}

@end
