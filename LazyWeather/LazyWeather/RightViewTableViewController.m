//
//  RightViewTableViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "RightViewTableViewController.h"
#import "RightViewTableViewCell.h"

@interface RightViewTableViewController ()


@end

@implementation RightViewTableViewController
{
    NSArray *text1Array;
    NSArray *text2Array;
    NSArray *img1Array;
    NSArray *img2Array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    text1Array = [[NSArray alloc]initWithObjects:@"提醒",@"设置",@"支持", nil];
    text2Array = [[NSArray alloc]initWithObjects:@"添加",@"定位",@"城市", nil];
    img1Array = [[NSArray alloc]initWithObjects:@"reminder",@"settings_normal",@"contact", nil];
    img2Array = [[NSArray alloc]initWithObjects:@"addcity",@"location_icon",@"city", nil];
    self.view.backgroundColor = [UIColor blackColor];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RightViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightCell" forIndexPath:indexPath];
    if(indexPath.section == 0){
        cell.lbText.text = text1Array[indexPath.row];
        cell.imgView.image = [UIImage imageNamed:img1Array[indexPath.row]];
    }
    else{
            cell.lbText.text = text2Array[indexPath.row];
            cell.imgView.image = [UIImage imageNamed:img2Array[indexPath.row]];
        }
    cell.lbText.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if(section == 1)
    {
        return @"                                 城市管理";
    }
    else
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
