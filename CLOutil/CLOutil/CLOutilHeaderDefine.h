//
//  CLOutilHeaderDefine.h
//  CLOutil
//
//  Created by hezhijingwei on 16/9/13.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#ifndef CLOutilHeaderDefine_h
#define CLOutilHeaderDefine_h

/**
 *  @strongify(self)/@weakify(self)
 */
#import "EXTScope.h"



/**
 *  打印
 *
 *  @param fmt <#fmt description#>
 *  @param ... <#... description#>
 *
 *  @return <#return value description#>
 */
#ifdef DEBUG
#define CLNSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define CLNSLog(...)
#endif

//屏幕尺寸
#define KScreen_Frame  [UIScreen mainScreen].bounds
#define KScreen_Size   [UIScreen mainScreen].bounds.size
#define KSCreen_Height ([UIScreen mainScreen].bounds.size.height)
#define KScreen_Width  ([UIScreen mainScreen].bounds.size.width)

// 弱转化
#define weakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

//16进制颜色
#define RGBValue(value) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define RGBA255(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define RGB255(r,g,b)     RGBA(r,g,b,1.0f)

#define black_Color     [UIColor blackColor]       // 0.0 white
#define darkGray_Color  [UIColor darkGrayColor]    // 0.333 white
#define lightGray_Color [UIColor lightGrayColor]   // 0.667 white
#define white_Color     [UIColor whiteColor]       // 1.0 white
#define gray_Color      [UIColor grayColor]        // 0.5 white
#define red_Color       [UIColor redColor]         // 1.0, 0.0, 0.0 RGB
#define green_Color     [UIColor greenColor]       // 0.0, 1.0, 0.0 RGB
#define blue_Color      [UIColor blueColor]        // 0.0, 0.0, 1.0 RGB
#define cyan_Color      [UIColor cyanColor]        // 0.0, 1.0, 1.0 RGB
#define yellow_Color    [UIColor yellowColor]      // 1.0, 1.0, 0.0 RGB
#define magenta_Color   [UIColor magentaColor]     // 1.0, 0.0, 1.0 RGB
#define orange_Color    [UIColor orangeColor]      // 1.0, 0.5, 0.0 RGB
#define purple_Color    [UIColor purpleColor]      // 0.5, 0.0, 0.5 RGB
#define brown_Color     [UIColor brownColor]       // 0.6, 0.4, 0.2 RGB
#define Clear_Color     [UIColor clearColor]       // 0.0 white, 0.0 alpha



// 设备版本号
#define iOS_Version                 [[UIDevice currentDevice].systemVersion floatValue]
#define font(x)                     [UIFont systemFontOfSize:x]

//plist文件
#define USERDefault                 [NSUserDefaults standardUserDefaults]
#define setObjectForKey(Object,key) [USERDefault setObject:Object forKey:@#key]; USERDefault.synchronize

#define ObjectForKey(key)           [USERDefault objectForKey:@#key]

//字符串拼接
#define AppentString(string,appentString) [@#string stringByAppendingString:@#appentString]


/*
 * @interface 单例
 */

#define Singleton_interface(Class)\
+ (instancetype)share##Class;


/*
 * @implementation 单例
 */

#define Singleton_implementation(Class) \
\
+ (instancetype)share##Class {\
    static Class *ClassName = nil;\
    dispatch_once_t onceToken = 0;\
    dispatch_once(&onceToken, ^{\
    ClassName = [[self alloc] init];\
});\
    return ClassName;\
}

/*
 * @implementation 归档的实现
 */

#define CodingImplementation \
- (instancetype)initWithCoder:(NSCoder *)coder\
{\
    self = [super init];\
    if (self) {\
        \
        [self code:coder];\
        \
    }\
    return self;\
}\
- (void)encodeWithCoder:(NSCoder *)coder\
{\
    [self encode:coder];\
    \
}



#endif /* CLOutilHeaderDefine_h */
