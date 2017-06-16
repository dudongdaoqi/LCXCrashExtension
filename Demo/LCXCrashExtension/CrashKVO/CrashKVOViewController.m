//
//  CrashKVOViewController.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "CrashKVOViewController.h"

@interface CrashKVOViewController ()

@property (nonatomic, strong) NSArray *datasource;

@end

@implementation CrashKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray *)datasource{
    if (!_datasource) {
        _datasource = ({
            NSArray *array = @[@{@"VC":@"KVOOneViewController",@"NAME":@"StashRemove"},
                               @{@"VC":@"KVOProtectViewController",@"NAME":@"KVO自我保护"}];
            array;
        });
    }
    return _datasource;
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
    [self pushClassViewController:[self vc:indexPath.row] animated:YES];
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
