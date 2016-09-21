//
//  CLOutil.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#ifndef CLOutil_h
#define CLOutil_h

/**
 * 这个是自己写的textView 因为官方UITextView没有placehold属性 自己写了一个存在
 * placehold属性 并且在还支持高度自适应！！！需要注意的是代理遵守的是
 * CLTextViewDelegate，而不是UITextViewDelegate
 */
#import "CLTextView.h"


/**
 *  这个是对字典转化成json字符串 不存在空格（例如：{@"name":@"小张"}）
    官方用NSString 生成的json字符串 有 " " 和 "\n" （例如：{\n@"name" : @"小张",\n@"age" : @"18"\n} ）
 */
#import "CLDictionaryToJson.h"


/**
 *  字典转化为字符串 普通的转化方法
 */
#import "NSDictionary+CLKeyValue.h"





/**
 *  一些常用的宏定义
 */
#import "CLOutilHeaderDefine.h"


/**
 *  UIView 的扩展 left、top、centerx、centery、width、height、maxx、maxy、orgin类的扩展 以及删除子视图
 */

#import "UIView+CLExtension.h"


/**
 *  手机的一些信息 版本号 应用名字 ...
 */
#import "NSBundle+BundleInfo.h"


/**
 *  base64转码
 */
#import "GTMBase64.h"


#import "NSString+CLExtention.h"
#import "NSArray+CLExtension.h"
#import "CLHelper.h"
#import "UILabel+CLExtension.h"
#import "UITextField+CLExtension.h"
#import "CLRegExp.h"


#endif /* CLOutil_h */
