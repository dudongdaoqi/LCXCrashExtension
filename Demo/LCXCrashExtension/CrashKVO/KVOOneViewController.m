//
//  KVOOneViewController.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "KVOOneViewController.h"
#import "KVOModel.h"

@interface KVOOneViewController ()
@property (nonatomic, strong) NSArray *datasource;
@end

@implementation KVOOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[KVOModel share] addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)dealloc{
    NSLog(@"******%@******",NSStringFromSelector(_cmd));
    [[KVOModel share] removeObserver:self forKeyPath:@"name"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([self isCurrentViewControllerVisible]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"background show" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }else{
        NSLog(@"background show");
    }
}


-(BOOL)isCurrentViewControllerVisible{
    
    NSLog(@"***firstObject***%@",self.navigationController.viewControllers.firstObject);
    NSLog(@"***self***%@",self);
    NSLog(@"%tu",[self.navigationController.viewControllers.firstObject isEqual:self]);
    NSLog(@"%tu",(self.navigationController.viewControllers.firstObject  == self));
    
    return (self.isViewLoaded && self.view.window);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    if (indexPath.row == 0) {
        [self pushClassViewController:[self vc:indexPath.row] animated:YES];

    }else{
        [self isCurrentViewControllerVisible];
    }
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
- (NSArray *)datasource{
    if (!_datasource) {
        _datasource = ({
            NSArray *array = @[@{@"VC":@"KVOTwoViewController",@"NAME":@"Next"},
                               @{@"VC":@"KVOTwoViewController",@"NAME":@"Next"}];
            array;
        });
    }
    return _datasource;
}

@end
