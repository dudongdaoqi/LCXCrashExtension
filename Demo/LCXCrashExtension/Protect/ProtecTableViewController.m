//
//  ProtecTableViewController.m
//  LCXCrashExtension
//
//  Created by xulicheng on 17/6/16.
//  Copyright © 2017年 licheng. All rights reserved.
//

#import "ProtecTableViewController.h"

#define isTestCrash 0

@interface ProtecTableViewController ()

@end

@implementation ProtecTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self protectTest];
}



- (void)protectTest{
    
    UILabel *tempLbl = [UILabel new];
    NSArray *firstArray = @[@"1",tempLbl,@"3"];
#if isTestCrash
    UILabel *parseLbl = [firstArray objectAtIndex:2];
    if (parseLbl) {
        //will crash->"NSObject+LCXCrashExtension"protect its crash
        NSLog(@"%tu",parseLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#else
    //recommend this
    UILabel *parseLbl = [firstArray parseObjectAtIndex:2 className:@"UILabel"];
    if (parseLbl) {
        NSLog(@"%tu",parseLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#endif
    
    NSArray *secondArray = @[@[@"1",tempLbl,@"3"],@[@"1",@"2",@"3"],@[@"1",@"2",@"3"]];
#if isTestCrash
    NSArray *tempArray = [secondArray objectAtIndex:0];
    UILabel *parseSecondLbl = [tempArray objectAtIndex:2];
    if (parseSecondLbl) {
        //will crash->"NSObject+LCXCrashExtension"protect its crash
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"fail");
    }
#else
    //recommend this
    UILabel *parseSecondLbl = [secondArray parseTableSection:0 row:2 className:@"UILabel"];
    if (parseSecondLbl) {
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }else{
        NSLog(@"%tu",parseSecondLbl.text);
        NSLog(@"success");
    }
#endif
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
