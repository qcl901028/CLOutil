//
//  NSBundle+BundleInfo.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (BundleInfo)


/**
 *  得到bundleid
 *
 *  @return <#return value description#>
 */
+ (NSString *)bundleIdentifier;


/**
 *  应用名称
 *
 *  @return <#return value description#>
 */
+ (NSString *)bundleName;


/**
 *  应用的显示名字
 *
 *  @return <#return value description#>
 */
+ (NSString *)bundleDisplayName;


/**
 *  应用的版本号
 *
 *  @return <#return value description#>
 */
+ (NSString *)bundleVersion ;



/**
 *  版本的构建版本号
 *
 *  @return <#return value description#>
 */
+ (NSString *)bundleBuildVersion;


/**
 *  获取设备型号
 *
 *  @return
 */
+ (NSString *)deviceVersion;


@end
