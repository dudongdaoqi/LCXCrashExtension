//
//  NSSet+LCXCrashExtension.m
//  LCXCrashExtension
//
//  Created by lc on 17/3/5.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "NSSet+LCXCrashExtension.h"
#import "NSObject+LCXCrashExtension.h"

@implementation NSSet (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(setWithObject:) replaceMethodSel:@selector(lc_setWithObject:)];
}

+ (instancetype)lc_setWithObject:(id)object{
    if (object){
        return [self lc_setWithObject:object];
    }else{
        return nil;
    }
}

@end
