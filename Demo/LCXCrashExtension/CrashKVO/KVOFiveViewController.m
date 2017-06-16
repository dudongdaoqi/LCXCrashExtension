//
//  KVOFiveViewController.m
//  LCXCrashExtension
//
//  Created by lc on 2017/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "KVOFiveViewController.h"
#import "KVOModel.h"

@interface KVOFiveViewController ()

@property (nonatomic, strong) UIButton *showBtn;


@end

@implementation KVOFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[KVOModel share] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    self.showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.showBtn setTitle:@"show" forState:UIControlStateNormal];
    [self.showBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.showBtn.frame = CGRectMake(100, 200, 60, 40);
    [self.showBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.showBtn];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"***thread***%@",[NSThread currentThread]);
    self.showBtn.frame = CGRectMake(100, 300, 60, 40);
}



- (void)btnClicked:(UIButton *)sender{
    NSLog(@"***thread***%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"***thread***%@",[NSThread currentThread]);
        [KVOModel share].name = @"show";
    });
}


-(void)dealloc{
    NSLog(@"******%@******",NSStringFromSelector(_cmd));
    [[KVOModel share] removeObserver:self forKeyPath:@"name"];
}
@end
