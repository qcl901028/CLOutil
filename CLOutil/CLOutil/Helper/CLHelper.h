//
//  CLHelper.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CLHelper : NSObject

/**
 *  记录运行的次数
 */
+ (void)recordAppRunCount;

/**
 *  这个判断是不是第一次运行 必须要记录app运行的次数
 *
 *  @return 
 */
+ (BOOL)isFirstRun;

/**
 *  得到文件全路径
 *  @param path 文件名字
 *  @return
 */
+ (NSString *)getPathWithFileName:(NSString *)fileName;

/**
 *  归档文件
 *  @param path 文件名字
 *  @return
 */
+ (void)archiverWithObject:(id)object fileName:(NSString *)fileName;


/**
 *  解档文件
 *  @param path 文件名字
 *  @return
 */
+ (id)unarchiverWithFileName:(NSString *)fileName;


/* 判断是不是越狱 */
+ (BOOL)isJailBreak;

/*
 * 来自MJExtension的MJFoundation； 是不是foundation框架下的基本类型
 */

+ (NSSet *)foundationClasses;

@end
