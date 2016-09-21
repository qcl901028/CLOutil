//
//  UIControl+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/19.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (CLExtension)


- (void)addtargetDidClickedCallBack:(void(^)(UIControl *control))didClickedCallBack;

@end
