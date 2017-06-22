//
//  CrashPushViewController.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "CrashPushViewController.h"

@interface CrashPushViewController ()

@end

@implementation CrashPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"CrashPushViewController";

    
    UITextView *text = [UITextView new];
    text.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-64);
    text.text = @" [self.navigationController pushViewController:self animated:YES];\n[self.navigationController pushViewController:self animated:YES];\n[self.navigationController pushViewController:[[self class]new] animated:NO];\n[self.navigationController pushViewController:self animated:NO];\n[self.navigationController pushViewController:self animated:NO];";
    [self.view addSubview:text];
    
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
//    [self.navigationController pushViewController:[NSClassFromString(@"PushAViewController") new] animated:NO];
//    [self.navigationController pushViewController:self animated:YES];
//    [self.navigationController pushViewController:self animated:YES];
    [self.navigationController pushViewController:[NSClassFromString(@"PushCViewController") new] animated:NO];
    [self.navigationController pushViewController:[NSClassFromString(@"PushAViewController") new] animated:YES];
    [self.navigationController pushViewController:[NSClassFromString(@"PushBViewController") new] animated:YES];
//    [self.navigationController pushViewController:self animated:NO];
//    [self.navigationController pushViewController:self animated:NO];
//    [self.navigationController pushViewController:self animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
