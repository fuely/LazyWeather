//
//  LeftViewTableViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "LeftViewTableViewController.h"
#import "LeftViewTableViewCell.h"

@interface LeftViewTableViewController ()

@end

@implementation LeftViewTableViewController
{
    NSArray *weekdays;
    NSArray *days;
    NSArray *weathers;
    NSArray *temperatures;
    
    UIColor *Color1;
    UIColor *Color2;
    UIColor *Color3;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    weekdays = [[NSArray alloc]initWithObjects:@"昨天",@"今天",@"明天",@"周五",@"周六",@"周日", nil];
    days = [[NSArray alloc]initWithObjects:@"05/03",@"05/04",@"05/05",@"05/06",@"05/07",@"05/08", nil];
    weathers = [[NSArray alloc]initWithObjects:@"阴",@"阴",@"多云",@"晴",@"多云",@"多云", nil];
    temperatures = [[NSArray alloc]initWithObjects:@"21~28°",@"22~29°",@"22~31°",@"22~28°",@"23~30°",@"23~28°", nil];
    self.view.backgroundColor = [UIColor blackColor];
    [self initColor];
    
    
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

    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.lbweek.text = weekdays[indexPath.row];
    cell.lbweek.font = [UIFont boldSystemFontOfSize:17];
    cell.lbdays.text = days[indexPath.row];
    cell.lbweather.text = weathers[indexPath.row];
    cell.lbweather.font = [UIFont boldSystemFontOfSize:20];
    cell.lbtemperature.text = temperatures[indexPath.row];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(168, 21.8, 100, 80)];
    imgView.layer.masksToBounds = YES;
    imgView.layer.cornerRadius = 20;
    [cell.contentView insertSubview:imgView atIndex:0];
    NSString *weatherColor = [self wenzichuli:weathers[indexPath.row]];
    if ([weatherColor isEqual: @"晴"])
        imgView.image = [self createImageWithColor:Color1];
    if ([weatherColor isEqual: @"多云"])
        imgView.image = [self createImageWithColor:Color2];
    if ([weatherColor rangeOfString:@"阴"].location != NSNotFound)
        imgView.image = [self createImageWithColor:Color3];
    return cell;
}

//将UIColor转化为UIIamge
- (UIImage*) createImageWithColor: (UIColor*) color

{
    
    CGRect rect=CGRectMake(0, 0, 1, 1);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    
    UIImage *senderImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return senderImage;
    
}
//初始化颜色
-(void)initColor
{
    Color1= [UIColor colorWithRed:0.0/255 green:200.0/255 blue:230.0/255 alpha:1];
    Color2= [UIColor colorWithRed:0.0/255 green:190.0/255 blue:200.0/255 alpha:1];
    Color3= [UIColor colorWithRed:0.0/255 green:128.0/255 blue:130.0/255 alpha:1];
}
//文字处理
-(NSString *)wenzichuli:(NSString *)string
{
    if([string rangeOfString:@"转"].location != NSNotFound){
        NSRange range = [string rangeOfString:@"转"];
        NSString *aaaa = [string substringFromIndex:range.location+1];
        NSString *cccc = [NSString stringWithFormat:@"%@",aaaa];
        return cccc;
    }
    else{
        NSString *cccc = [NSString stringWithFormat:@"%@",string];
        return cccc;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
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
