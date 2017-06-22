//
//  PushAViewController.m
//  LCXCrashExtension
//
//  Created by lc on 2017/6/20.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "PushAViewController.h"

@interface PushAViewController ()

@end

@implementation PushAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"A";
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"show" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(100, 100, 60, 40);
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
}

- (void)btnClicked:(UIButton *)sender{
    [self pushTest];
}

- (void)pushTest{
    [self.navigationController pushViewController:[NSClassFromString(@"PushBViewController") new] animated:YES];
}


@end
