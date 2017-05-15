//
//  ProtectTest.m
//  LCXCrashExtension
//
//  Created by lc on 17/5/16.
//  Copyright © 2017年 lc. All rights reserved.
//

#import "ProtectTest.h"
#import "LCXProtectCenter.h"

#define isTestCrash 0

@implementation ProtectTest

+ (void)protectTest{
    
    UILabel *tempLbl = [UILabel new];
    NSArray *firstArray = @[@"1",tempLbl,@"3"];
#if isTestCrash
    UILabel *parseLbl = [firstArray objectAtIndex:2];
    if (parseLbl) {
        //will crash->"NSObject+LCXCrashExtension"protect its crash
        NSLog(@"%tu",parseLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#else
    //recommend this
    UILabel *parseLbl = [firstArray parseObjectAtIndex:2 className:@"UILabel"];
    if (parseLbl) {
        NSLog(@"%tu",parseLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#endif
    
    NSArray *secondArray = @[@[@"1",tempLbl,@"3"],@[@"1",@"2",@"3"],@[@"1",@"2",@"3"]];
#if isTestCrash
    NSArray *tempArray = [secondArray objectAtIndex:0];
    UILabel *parseSecondLbl = [tempArray objectAtIndex:2];
    if (parseSecondLbl) {
        //will crash->"NSObject+LCXCrashExtension"protect its crash
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#else
    //recommend this
    UILabel *parseSecondLbl = [secondArray parseTableSection:0 row:2 className:@"UILabel"];
    if (parseSecondLbl) {
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }
#endif
}

@end
