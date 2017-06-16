//
//  KVOThreeViewController.m
//  LCXCrashExtension
//
//  Created by lc on 2017/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "KVOThreeViewController.h"
#import "KVOModel.h"

@interface KVOThreeViewController ()

@end

@implementation KVOThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"show" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(100, 100, 60, 40);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
    
    UIButton *next = [UIButton buttonWithType:UIButtonTypeCustom];
    [next setTitle:@"next" forState:UIControlStateNormal];
    [next addTarget:self action:@selector(btnnextClicked:) forControlEvents:UIControlEventTouchUpInside];
    next.frame = CGRectMake(100, 200, 60, 40);
    [next setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:next];
}

- (void)btnnextClicked:(UIButton *)sender{
    [self pushClassViewController:@"KVOFourViewController" animated:YES];
}

- (void)btnClicked:(UIButton *)sender{
    [KVOModel share].name = @"show";
}

@end
