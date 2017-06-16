//
//  KVOFourViewController.m
//  LCXCrashExtension
//
//  Created by lc on 2017/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "KVOFourViewController.h"
#import "KVOModel.h"

@interface KVOFourViewController ()

@end

@implementation KVOFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [[KVOModel share] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
//    [[KVOModel share] removeObserver:self forKeyPath:@"name"];
}

- (void)go{
    NSLog(@"go");
}

-(void)dealloc{
    NSLog(@"******%@******",NSStringFromSelector(_cmd));
}



@end
