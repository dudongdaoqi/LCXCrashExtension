//
//  CrashNSStringTableViewController.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "CrashNSStringTableViewController.h"

@interface CrashNSStringTableViewController ()

@end

@implementation CrashNSStringTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stringTest];
    [self attriTest];
}


- (void)stringTest{
    NSString *good = [[NSString alloc]initWithString:nil];
    NSString *good2 = [NSString stringWithString:nil];
    
    NSString *tempContstStr = @"123123";
    NSString *tempContstStr1 = [tempContstStr substringFromIndex:10];
    NSString *tempContstStr2 = [tempContstStr substringToIndex:10];
    NSString *tempContstStr3 = [tempContstStr substringWithRange:NSMakeRange(6, 1)];
    
    NSString *tempPointStr = [[NSString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempPointStr1 = [tempPointStr substringFromIndex:10];
    NSString *tempPointStr2 = [tempPointStr substringToIndex:10];
    NSString *tempPointStr3 = [tempPointStr substringWithRange:NSMakeRange(6, 1)];
    
    NSMutableString *tempCFStr = [[NSMutableString alloc]initWithFormat:@"123%@",@"123"];
    NSString *tempCFStr1 = [tempCFStr substringFromIndex:10];
    NSString *tempCFStr2 = [tempCFStr substringToIndex:10];
    NSString *tempCFStr3 = [tempCFStr substringWithRange:NSMakeRange(6, 1)];
}



- (void)attriTest{
    NSAttributedString *tempString1 = [[NSAttributedString alloc]initWithString:nil];
    NSAttributedString *tempString2 = [[NSAttributedString alloc]initWithAttributedString:nil];
    NSAttributedString *tempString3 = [[NSAttributedString alloc]initWithString:nil attributes:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
