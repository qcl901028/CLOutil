//
//  UIView+CLExtension.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "UIView+CLExtension.h"
#import <objc/runtime.h>

@implementation UIView (CLExtension)


- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    
}

- (CGSize)size {
    
    return self.frame.size;
}


- (void)setLeft:(CGFloat)left {

    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
    
}

- (CGFloat)left {
    return self.frame.origin.x;
}


- (void)setTop:(CGFloat)top {
    
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
    
}

- (CGFloat)top {
    
    return self.frame.origin.y;
}

- (void)setMaxX:(CGFloat)maxX {

    CGRect frame = self.frame;

    frame.origin.x = maxX - self.frame.size.width;
    
    self.frame = frame;
}

- (CGFloat)maxX {
    
    return self.frame.origin.x+self.frame.size.width;

}

- (void)setMaxY:(CGFloat)maxY {
    
    CGRect frame = self.frame;
    frame.origin.y = maxY - self.frame.size.height;
    
    self.frame = frame;
    
}

- (CGFloat)maxY {

    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX {
    
    self.center = CGPointMake(centerX, self.center.y);
    
    
}

- (CGFloat)centerX
{
    return self.center.x;
}


- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)centerY {
    
    return self.center.y;
}


- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}

- (CGFloat)width {
    
    return self.frame.size.width;
    
}

- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}

- (CGFloat)height {
    
    return self.frame.size.height;
    
}

- (void)setOrigin:(CGPoint)origin {
    
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
    
}

- (CGPoint)origin {
    
    return self.frame.origin;
}

- (void)removeSubViews {
    
    for (UIView *view in self.subviews) {
        
        [view removeFromSuperview];
        
    }

    
}

//clickedCallBack

- (void)setClickedCallBack:(void(^)(UIView *view))clickedCallBack {
    
    objc_setAssociatedObject(self, @selector(clickedCallBack), clickedCallBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

- (void(^)(UIView *view))clickedCallBack {
    
  return objc_getAssociatedObject(self, @selector(clickedCallBack));
    
}


- (void)addTargetDidClicked:(void (^)(UIView *View))didClicked {
    
    self.clickedCallBack = didClicked;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [super touchesEnded:touches withEvent:event];
    
    if (self.clickedCallBack) {
        self.clickedCallBack(self);
    }
    
}


@end
