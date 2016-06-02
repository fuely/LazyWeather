//
//  WeatherScrollView.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/7.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "WeatherScrollView.h"
#import "WeatherDelegate.h"

@interface WeatherScrollView ()

@end

@implementation WeatherScrollView

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0, 375, 667)];
    
    WeatherDelegate *weatherDelegate = [[WeatherDelegate alloc]init];
    
    NSArray *weatherArrray = [weatherDelegate readWeatherArrayAtIndex:0];
    [weatherDelegate readAqiDictionary];
    
    
    NSDictionary *yesterday = [weatherDelegate readYesterdayWeatherDictionary];
    NSDictionary *today = [weatherDelegate readTodayWeatherDictionary];

    NSArray *weeks = [[NSArray alloc]initWithObjects:@"昨天",@"今天",@"明天",[weatherArrray[2] valueForKey:@"week"],[weatherArrray[3] valueForKey:@"week"],[weatherArrray[4] valueForKey:@"week"], nil];
    for (int i = 0; i<6; i++) {
        UILabel *lbweek =[[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 60, 240, 40)];
        lbweek.text = weeks[i];
        lbweek.font = [UIFont boldSystemFontOfSize:30];
        
        UILabel *lbweather =[[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 110, 240, 40)];
        if (i==0) {
        lbweather.text = [NSString stringWithFormat:@"%@ %@",[yesterday valueForKey:@"weather"],[weatherArrray[i] valueForKey:@"temperature"]];
        }
        else if (i==1) {
            lbweather.text = [NSString stringWithFormat:@"%@ %@",[today valueForKey:@"weather"],[weatherArrray[i] valueForKey:@"temperature"]];
        }
          else
             {
                    lbweather.text = [NSString stringWithFormat:@"%@ %@",[weatherArrray[i-1] valueForKey:@"weather"],[weatherArrray[i-1] valueForKey:@"temperature"]];
        }
        lbweather.font = [UIFont systemFontOfSize:25];
        
        UILabel *lbdays = [[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 170, 240, 40)];
        if (i==0) {
                    lbdays.text = [NSString stringWithFormat:@"%@ %@",weeks[i],[[yesterday valueForKey:@"uptime"] substringToIndex:10]];
        }
        else{
        lbdays.text = [NSString stringWithFormat:@"%@ %@",weeks[i],[weatherArrray[i-1] valueForKey:@"days"]];
        }
        UILabel *lbaqi = [[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 190, 240, 40)];
        lbaqi.text = weatherDelegate.aqiremark;
        
        UILabel *lbwind = [[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 230, 240, 40)];
        if (i==0) {
            lbwind.text = [NSString stringWithFormat:@"%@ %@",[yesterday valueForKey:@"wind"],[yesterday valueForKey:@"winp"]];
        }else{
        lbwind.text = [NSString stringWithFormat:@"%@ %@",[weatherArrray[i-1] valueForKey:@"wind"],[weatherArrray[i-1] valueForKey:@"winp"]];
        }
        UILabel *lbsun = [[UILabel alloc]initWithFrame:CGRectMake(i*375+40, 250, 240, 40)];
        lbsun.text = @"日出05:30 日落18:40";
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(i*375,0, 375, 667)];
        UIImageView *imgcolor = [[UIImageView alloc]initWithFrame:CGRectMake(i*375,0, 375, 667)];
        if (i==0) {
            [self backColor:[yesterday valueForKey:@"weather"] withImgView:imgView withImgColor:imgcolor];
        } else if (i==1)
        {
            [self backColor:[today valueForKey:@"weather"] withImgView:imgView withImgColor:imgcolor];
        }
        else
        [self backColor:[weatherArrray[i-1] valueForKey:@"weather"] withImgView:imgView withImgColor:imgcolor];
        [_scrollView addSubview:lbweek];
        [_scrollView addSubview:lbweather];
        [_scrollView addSubview:lbdays];
        [_scrollView addSubview:lbaqi];
        [_scrollView addSubview:lbwind];
        [_scrollView addSubview:lbsun];
        
    }

    
    _scrollView.contentSize = CGSizeMake(375*6, 667);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(130, 600, 120, 40)];
    _pageControl.numberOfPages = 6;
    [_pageControl addTarget:self action:@selector(changePages) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(320, 20, 40, 40)];
    [btn setImage:[UIImage imageNamed:@"close_hover"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)backColor:(NSString *)weather withImgView:(UIImageView *)imgView
     withImgColor:(UIImageView *)imgcolor
{
    imgView.image = [UIImage imageNamed:@"cloudy"];
    if ([weather length]>2) {
        weather = [weather substringToIndex:2];
    }
    if ([weather isEqual: @"晴"])
        imgcolor.backgroundColor = [UIColor colorWithRed:244.0/255 green:222.0/255 blue:41.0/255 alpha:0.5];
    if ([weather isEqual: @"多云"])
        imgcolor.backgroundColor = [UIColor colorWithRed:147.0/255 green:224.0/255 blue:255.0/255 alpha:0.7];
    if ([weather isEqual: @"阴"])
        imgcolor.backgroundColor = [UIColor colorWithRed:92.0/255 green:167.0/255 blue:186.0/255 alpha:0.5];
    if ([weather rangeOfString:@"雨"].location != NSNotFound)
    {
       imgcolor.backgroundColor = [UIColor colorWithRed:179.0/255 green:230.0/255 blue:135.0/255 alpha:0.5];
        imgView.image = [UIImage imageNamed:@"rainy"];
    }

    [_scrollView addSubview:imgView];
    [_scrollView addSubview:imgcolor];

}

- (void)btnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)changePages
{
    [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage*375, 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate协议方法（代理方法）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    _pageControl.currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    
}

@end

