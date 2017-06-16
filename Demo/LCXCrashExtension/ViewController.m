//
//  ViewController.m
//  LCXCrashExtension
//
//  Created by lc on 17/1/18.
//  Copyright © 2017年 lc. All rights reserved.
//
//原理介绍请见：http://www.jianshu.com/p/2b2997749d2d

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSString *kvc;

@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSArray *datasource;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
}

#pragma mark TableView


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ViewController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self name:indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self pushClassViewController:[self vc:indexPath.row] animated:YES];
}

#pragma mark - getting

- (NSArray *)datasource{
    if (!_datasource) {
        _datasource = ({
            NSArray *array = @[@{@"VC":@"ProtecTableViewController",@"NAME":@"自我防御"},
                               @{@"VC":@"CrashScopeViewController",@"NAME":@"容错不当造成的Crash"},
                               @{@"VC":@"CrashKVOViewController",@"NAME":@"KVO造成的Crash"},
                               @{@"VC":@"CrashThreadViewController",@"NAME":@"线程安全造成的Crash"},
                               @{@"VC":@"CrashPushViewController",@"NAME":@"多次Push造成的Crash"},];
            array;
        });
    }
    return _datasource;
}

- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = ({
            UITableView *myTableview = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            myTableview.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
            myTableview.backgroundColor = [UIColor whiteColor];
            myTableview.delegate = self;
            myTableview.dataSource = self;
            myTableview;
        });
    }
    return _tableview;
}


- (NSString *)name:(NSInteger)row{
    NSDictionary *dict = [self.datasource parseObjectAtIndex:row className:@"NSDictionary"];
    if (dict) {
        return [dict parseStringKey:@"NAME"];
    }
    return nil;
}

- (NSString *)vc:(NSInteger)row{
    NSDictionary *dict = [self.datasource parseObjectAtIndex:row className:@"NSDictionary"];
    if (dict) {
        return [dict parseStringKey:@"VC"];
    }
    return nil;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
