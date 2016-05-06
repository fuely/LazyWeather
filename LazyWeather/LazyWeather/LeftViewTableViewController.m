//
//  LeftViewTableViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "LeftViewTableViewController.h"
#import "LeftViewTableViewCell.h"
#import "WeatherDelegate.h"

@interface LeftViewTableViewController ()

@end

@implementation LeftViewTableViewController
{
    NSArray *weekdays;
    NSArray *days;
    NSArray *weathers;
    NSArray *temperatures;
    
    UIColor *color1;
    UIColor *color2;
    UIColor *color3;
    UIColor *color4;
    WeatherDelegate *weatherDelegate;
    NSMutableArray *dicDay;
    NSMutableArray *strWeather;
    NSMutableArray *temp;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    weatherDelegate = [WeatherDelegate readData];
    dicDay = [[NSMutableArray alloc]init];
    strWeather = [[NSMutableArray alloc]init];
    temp = [[NSMutableArray alloc]init];
    for (int i=0; i<7; i++) {
        dicDay[i] = [weatherDelegate readWeatherDictionaryAtIndex:i];
        strWeather[i] = weatherDelegate.readWeather;
        temp[i] = weatherDelegate.readTemperature;
    }

    weekdays = [[NSArray alloc]initWithObjects:@"昨天",@"今天",@"明天",[dicDay[2] valueForKey:@"week"],[dicDay[3] valueForKey:@"week"],[dicDay[4] valueForKey:@"week"], nil];
    days = [[NSArray alloc]initWithObjects:@"05/03",[dicDay[0] valueForKey:@"days"],[dicDay[1] valueForKey:@"days"],[dicDay[2] valueForKey:@"days"],[dicDay[3] valueForKey:@"days"],[dicDay[4] valueForKey:@"days"], nil];
    weathers = [[NSArray alloc]initWithObjects:strWeather[0],strWeather[0],strWeather[1],strWeather[2],strWeather[3],strWeather[4], nil];
    temperatures = [[NSArray alloc]initWithObjects:temp[0],temp[0],temp[1],temp[2],temp[3],temp[4], nil];
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
        imgView.image = [self createImageWithColor:color1];
    if ([weatherColor isEqual: @"多云"])
        imgView.image = [self createImageWithColor:color2];
    if ([weatherColor isEqual: @"阴"])
        imgView.image = [self createImageWithColor:color3];
    if ([weatherColor rangeOfString:@"雨"].location != NSNotFound)
        imgView.image = [self createImageWithColor:color4];
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
    color1= [UIColor colorWithRed:0.0/255 green:200.0/255 blue:230.0/255 alpha:1];
    color2= [UIColor colorWithRed:0.0/255 green:190.0/255 blue:200.0/255 alpha:1];
    color3= [UIColor colorWithRed:0.0/255 green:128.0/255 blue:130.0/255 alpha:1];
    color4= [UIColor colorWithRed:220.0/255 green:128.0/255 blue:110.0/255 alpha:1];
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
