//
//  ViewController.m
//  LCXCrashExtension
//
//  Created by lc on 17/1/18.
//  Copyright © 2017年 lc. All rights reserved.
//
//原理介绍请见：http://www.jianshu.com/p/2b2997749d2d

#import "ViewController.h"
#import "ProtectTest.h"
#import "CrashTest.h"
#import "TestModel.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *kvc;
@property (nonatomic, strong) TestModel *model;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [ProtectTest protectTest];
    [CrashTest crashTest];
}

- (void)viewWillAppear:(BOOL)animated{
    [self kvoTest];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self kvoRemove];
}

- (IBAction)pushAction:(id)sender {
    [self pushTest];
}

#pragma mark -kvo

- (void)kvoTest{
    [self addObserver:self forKeyPath:nil options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [self addObserver:self forKeyPath:@"kvc" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
}

- (void)kvoRemove{
    [self removeObserver:nil forKeyPath:@"kvc"];
    [self removeObserver:self forKeyPath:nil];
    [self removeObserver:self forKeyPath:@"kvc"];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self removeObserver:self forKeyPath:@"kvc"];
    });
}

#pragma mark push

- (void)pushTest{
    [self.navigationController pushViewController:self animated:YES];
    [self.navigationController pushViewController:self animated:YES];
    [self.navigationController pushViewController:[[self class]new] animated:NO];
    [self.navigationController pushViewController:self animated:NO];
    [self.navigationController pushViewController:self animated:NO];
}

#pragma mark thread safe
//此处crash，请注意
- (IBAction)threadSafe:(id)sender {
    for (int i = 0; i < 10000; i++){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.model = [TestModel new];
        });
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.model = [TestModel new];
        });
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.model = [TestModel new];
        });
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
