//
//  UIView+CLExtension.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (CLExtension)

@property (nonatomic, assign) CGSize size;
@property (nonatomic ,assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;

//@property (nonatomic ,copy) void(^clickedCallBack)(UIView *view);
/*
 *  删除所有的子视图
 */
- (void)removeSubViews;
/*
 *  视图被点击
 */
- (void)addTargetDidClicked:(void(^)(UIView *view))didClicked;

@end
