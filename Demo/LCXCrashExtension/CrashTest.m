
//
//  CrrashTest.m
//  LCXCrashExtension
//
//  Created by lc on 17/5/16.
//  Copyright © 2017年 lc. All rights reserved.
//

/*
 注意：
 需要要将LCXCrashExtension相关文件设置为MRC环境
 设置方法：
 Build Phases->Complie Sources 设置-fno-objc-arc
 */

#import "CrashTest.h"

@implementation CrashTest

+ (void)crashTest
{
    [self dictTest];
    [self arrayTest];
    [self stringTest];
    [self attriTest];
}


+ (void)arrayTest
{
    NSArray *array = [NSArray new];
    [array objectAtIndex:0];
    
    NSArray *arrayRang = [[NSArray alloc]initWithObjects:@"1", nil];
    [arrayRang objectAtIndex:6];
    
    NSMutableArray *marray = [NSMutableArray new];
    [marray objectAtIndex:1];
    [marray addObject:nil];
    [marray insertObject:nil atIndex:0];
    [marray removeObjectAtIndex:2];
    [marray replaceObjectAtIndex:3 withObject:@"1"];
    [marray replaceObjectAtIndex:1 withObject:nil];
    
    NSArray *garray = @[@"1",@"2",@"3"];
    [garray objectAtIndex:4];
}

+ (void)stringTest
{
    NSString *good = [[NSString alloc]initWithString:nil];
    NSString *good2 = [NSString stringWithString:nil];
    
    NSString *tempContstStr = @"123123";
    NSString *tempContstStr1 = [tempContstStr substringFromIndex:10];
    NSString *tempContstStr2 = [tempContstStr substringToIndex:10];
    NSString *tempContstStr3 = [tempContstStr substringWithRange:NSMakeRange(6, 1)];
    
    NSString *tempPointStr = [[NSString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempPointStr1 = [tempPointStr substringFromIndex:10];
    NSString *tempPointStr2 = [tempPointStr substringToIndex:10];
    NSString *tempPointStr3 = [tempPointStr substringWithRange:NSMakeRange(6, 1)];
    
    NSMutableString *tempCFStr = [[NSMutableString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempCFStr1 = [tempCFStr substringFromIndex:10];
    NSString *tempCFStr2 = [tempCFStr substringToIndex:10];
    NSString *tempCFStr3 = [tempCFStr substringWithRange:NSMakeRange(6, 1)];
}

+ (void)attriTest
{
    NSAttributedString *tempString1 = [[NSAttributedString alloc]initWithString:nil];
    NSAttributedString *tempString2 = [[NSAttributedString alloc]initWithAttributedString:nil];
    NSAttributedString *tempString3 = [[NSAttributedString alloc]initWithString:nil attributes:nil];
}

+ (void)dictTest
{
    NSMutableDictionary *tempDict = [NSMutableDictionary new];
    [tempDict setObject:nil forKey:@"1"];
    [tempDict removeObjectForKey:@"2"];
    [tempDict removeObjectForKey:nil];
}

@end
