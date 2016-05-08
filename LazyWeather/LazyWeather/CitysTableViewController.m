//
//  CitysTableViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/8.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "CitysTableViewController.h"
#import "WeatherDelegate.h"

@interface CitysTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fieldText;

@end

@implementation CitysTableViewController
{
    NSDictionary *citysDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WeatherDelegate *cityDelegate = [[WeatherDelegate alloc]init];
    citysDic = [cityDelegate readAllCitysDictionary];
    //设置文本框的边框 样式
    _fieldText.borderStyle = UITextBorderStyleRoundedRect;
    _fieldText.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_b"]];
    _fieldText.leftViewMode = UITextFieldViewModeAlways;
    //在此次编辑时清除上次编辑的内容
    _fieldText.clearsOnBeginEditing = YES;
    
    //设置占位内容 place 空间
    _fieldText.placeholder = @"城市名称或拼音";
    
    //设置一键清除
    _fieldText.clearButtonMode = UITextFieldViewModeAlways;
    
    //设置键盘样式
    _fieldText.keyboardType = UIKeyboardTypeDefault;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_fieldText resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    NSDictionary *city = [citysDic valueForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    cell.textLabel.text = [city valueForKey:@"citynm"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"自动定位";
    }
        cell.textLabel.textColor = [UIColor grayColor];
    return cell;
}
- (IBAction)backClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
