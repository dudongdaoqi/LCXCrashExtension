//
//  NSMutableSet+LCXCrashExtension.m
//  LCXCrashExtension
//
//  Created by lc on 17/3/5.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "NSMutableSet+LCXCrashExtension.h"
#import "NSObject+LCXCrashExtension.h"

@implementation NSMutableSet (LCXCrashExtension)

+ (void)load{
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(addObject:) replaceMethodSel:@selector(lc_addObject:)];
    [self exchangeInstanceMethod:[self class] originMethodSel:@selector(removeObject:) replaceMethodSel:@selector(lc_removeObject:)];
}

- (void)lc_addObject:(id)anObject{
    if (anObject) {
        [self lc_addObject:anObject];
    }
}

- (void)lc_removeObject:(id)anObject{
    if (anObject) {
        [self lc_removeObject:anObject];
    }
}

@end
