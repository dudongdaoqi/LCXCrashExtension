//
//  KVOModel.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "KVOModel.h"

@implementation KVOModel

+(instancetype)share{
    static id instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
