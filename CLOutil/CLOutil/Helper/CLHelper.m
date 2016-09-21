//
//  CLHelper.m
//  CLOutil
//
//  Created by hezhijingwei on 16/9/14.
//  Copyright © 2016年 秦传龙. All rights reserved.
//

#import "CLHelper.h"
#import "NSBundle+BundleInfo.h"

static NSString *const runCount = @"runcount";

@implementation CLHelper

+ (void)recordAppRunCount {
    
   NSNumber *account = [[NSUserDefaults standardUserDefaults] objectForKey:runCount];
    
    NSInteger count = [account integerValue];
    
    count ++;
    
    [[NSUserDefaults standardUserDefaults] setObject:@(count) forKey:runCount];
    
}

+ (BOOL)isFirstRun {
    
    NSNumber *account = [[NSUserDefaults standardUserDefaults] objectForKey:runCount];
    NSInteger count = [account integerValue];
    
    if (count == 1) {
        return YES;
    }
    
    return NO;
}

+ (NSString *)getPathWithFileName:(NSString *)fileName {
    
    NSString *pathString = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [pathString stringByAppendingPathComponent:fileName];
    
}

+ (void)archiverWithObject:(id)object fileName:(NSString *)fileName {
    
   BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:[self getPathWithFileName:fileName]];
    
    if (success) {
        NSLog(@"归档成功");
    } else {
        
        NSLog(@"归档失败");
        
    }
    
}

+ (id)unarchiverWithFileName:(NSString *)fileName {
    
    id result = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getPathWithFileName:fileName]];
    
    return result;
}

#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])

const char* jailbreak_tool_pathes[] = {
    
    "/Applications/Cydia.app",
    
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    
    "/bin/bash",
    
    "/usr/sbin/sshd",
    
    "/etc/apt"
};


/* 判断是不是越狱 */
+ (BOOL)isJailBreak

{
    
    for (int i=0; i<ARRAY_SIZE(jailbreak_tool_pathes); i++) {
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_tool_pathes[i]]] && ![[NSBundle deviceVersion] isEqualToString:@"Simulator"]) {
            
            return YES;
        }
        
    }
    
    return NO;
    
}

+ (NSSet *)foundationClasses
{
    
        // 集合中没有NSObject，因为几乎所有的类都是继承自NSObject，具体是不是NSObject需要特殊判断
      NSSet * foundationClasses_ = [NSSet setWithObjects:
                                    [NSURL class],
                                    [NSDate class],
                                    [NSValue class],
                                    [NSData class],
                                    [NSError class],
                                    [NSArray class],
                                    [NSDictionary class],
                                    [NSString class],
                                    [NSSet class],
                                    [NSAttributedString class],
                                    [NSData class],nil];

    return foundationClasses_;
}





@end
