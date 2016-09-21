//
//  UIControl+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/19.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "UIControl+CLExtension.h"
#import <objc/runtime.h>

@implementation UIControl (CLExtension)

- (void)setDidClickedCallBack:(void(^)(UIControl *control))didClickedCallBack {
    
    objc_setAssociatedObject(self, @selector(didClickedCallBack), didClickedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (void(^)(UIControl *control))didClickedCallBack {
    
    return objc_getAssociatedObject(self, @selector(didClickedCallBack));
    
}

- (void)addtargetDidClickedCallBack:(void (^)(UIControl *control))didClickedCallBack {
    
    self.didClickedCallBack = didClickedCallBack;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    if (self.didClickedCallBack) {
        self.didClickedCallBack(self);
    }
    
}


@end
