//
//  WeatherScrollView.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/7.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherScrollView : UIViewController<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView* scrollView;
@property (nonatomic,strong) UIPageControl* pageControl;

@end
