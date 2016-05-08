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
    self.view.frame = CGRectMake(80, 0, 375, 667);
    
    
    
}

//视图出现时运行
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [UIView beginAnimations:@"moveView" context:nil];
    [UIView setAnimationDuration:0.30f];
    self.view.frame = CGRectMake(80, 0, 375, 667);
    [UIView commitAnimations];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                [self performSegueWithIdentifier:@"RightToAlerts" sender:nil];
                break;
            case 1:
                [self performSegueWithIdentifier:@"RightToSet" sender:nil];
                break;
            case 2:
                [self performSegueWithIdentifier:@"RightToSupport" sender:nil];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                [self performSegueWithIdentifier:@"RightToCitys" sender:nil];
                break;
            case 1:
                break;
            case 2:
                break;
            default:
                break;
        }

    }
}


@end
