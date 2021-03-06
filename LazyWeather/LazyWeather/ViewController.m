//
//  ViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "ViewController.h"
#import "FirstCollectionCell.h"
#import "SecondCollectionCell.h"
#import "ThirdCollectionCell.h"
#import "WeatherData.h"
#import "LocalData.h"
#import "WeatherDelegate.h"
#import "MyCoreLacation.h"
#import "MJRefresh.h"

@interface ViewController ()
@property (nonatomic,strong) CLLocationManager *locationManager;

@end


@implementation ViewController
{
    CGFloat pianyi;
    UIPanGestureRecognizer *gesture1;
    UITapGestureRecognizer *gesture2;
    UIButton *heartBtn;
    UIColor *backColor;
    
}

static NSString * const reuseIdentifier = @"FirstCell";

- (void)viewDidLoad {
    [super viewDidLoad];
       
    //定位服务初始化并弹出用户授权对话框
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager requestAlwaysAuthorization];
    
    //查询网络数据
    WeatherData *weatherData = [[WeatherData alloc]init];
    [weatherData startRequest];
    
    //下拉刷新
    _mCenterCollectionCtr.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weatherData startRequest];
        
        [self.mCenterCollectionCtr reloadData];
        
        [_mCenterCollectionCtr.mj_header endRefreshing];
    }];
    
    //设置_mCenterCollectionCtr代理,加载cell
    _mCenterCollectionCtr.delegate = self;
    _mCenterCollectionCtr.dataSource = self;
    [self backgroundImg];

    //左右页面初始化
    [self addLeftViewwithRightView];
    
     backColor = [UIColor colorWithRed:0 green:arc4random()%200/255.0 blue:arc4random()%255/255.0 alpha:0.5];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updata) name:@"updata" object:nil];
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)updata
{
    [self.mCenterCollectionCtr reloadData];
}

#pragma mark - UICollectionViewDataSource
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//定义展示的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //注册cell与Xib
    [_mCenterCollectionCtr registerClass:[FirstCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [_mCenterCollectionCtr registerClass:[SecondCollectionCell class] forCellWithReuseIdentifier:@"SecondCell"];
    [_mCenterCollectionCtr registerClass:[ThirdCollectionCell class] forCellWithReuseIdentifier:@"ThirdCell"];
    
    UINib *nib = [UINib nibWithNibName:@"FirstCollectionCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    
    //实例化cell
    UICollectionViewCell *cell = [[UICollectionViewCell alloc]init];
    FirstCollectionCell *firstCell =[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    SecondCollectionCell *secondCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCell" forIndexPath:indexPath];
    ThirdCollectionCell *thirdCell =[collectionView dequeueReusableCellWithReuseIdentifier:@"ThirdCell" forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
        {
            firstCell.backgroundColor = backColor;
            [firstCell.centerToolBar.items[0] setAction:@selector(toLeftView)];
            [firstCell.centerToolBar.items[4] setAction:@selector(toRightView)];
            cell = firstCell;
        
        }
            break;
        case 1:
        {
            secondCell.airView.textColor =backColor;
            secondCell.airlb.textColor = backColor;
            secondCell.airText.textColor = backColor;
            secondCell.toplb.textColor = backColor;
            secondCell.pm2.textColor = backColor;
            secondCell.pm10.textColor = backColor;
            secondCell.no2.textColor = backColor;
            secondCell.so2.textColor = backColor;
            secondCell.o3.textColor = backColor;
            secondCell.co.textColor =backColor;
            [secondCell.setBtn addTarget:self action:@selector(setBtnClick) forControlEvents:UIControlEventTouchUpInside];
            cell = secondCell;
        }
            break;
        case 2:
        {
            [thirdCell.setBtn addTarget:self action:@selector(setBtnClick) forControlEvents:UIControlEventTouchUpInside];
            cell = thirdCell;
        }
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    switch (indexPath.row) {
        case 0:
            size = CGSizeMake(380, 875);
            break;
        case 1:
            size = CGSizeMake(380, 667);
            break;
        default:
            size = CGSizeMake(380, 667);
            break;
    }
    
    return size;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

#pragma mark - 滑动页面事件
- (void)addLeftViewwithRightView
{
    //滑动手势初始化设置
    gesture1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestures1:)];
    [self.view addGestureRecognizer:gesture1];
    
    //点击手势初始化设置
    gesture2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gestures2:)];
    [_mCenterCollectionCtr addGestureRecognizer:gesture2];
    [gesture2 setEnabled:NO];
    
    //添加左右页面
    self.leftDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftView"];
    self.leftDrawerViewController.view.frame = CGRectMake(-40, 0, 375, 667);
    [self.view insertSubview:self.leftDrawerViewController.view belowSubview:_mCenterCollectionCtr];
    self.rightDrawerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightView"];
    self.rightDrawerViewController.view.frame = CGRectMake(80, 0, 375, 667);
    [self.view insertSubview:self.rightDrawerViewController.view belowSubview:_mCenterCollectionCtr];
    
}
//点击事件
- (void)gestures2:(UITapGestureRecognizer *)gesture
{
    [self translation:0];
    pianyi = 0.0f;
    [gesture setEnabled:NO];
}
//点击按钮出行左页面
- (void)toLeftView
{
    pianyi = 240;
    if(pianyi > 0)
        [self.rightDrawerViewController.view setHidden:YES];
    if(pianyi < 0)
        [self.rightDrawerViewController.view setHidden:NO];
    [self translation:240];
    [gesture2 setEnabled:YES];

}
//点击按钮出行右页面
- (void)toRightView
{
    pianyi = -240;
    if(pianyi > 0)
        [self.rightDrawerViewController.view setHidden:YES];
    if(pianyi < 0)
        [self.rightDrawerViewController.view setHidden:NO];
    [self translation:-240];
    [gesture2 setEnabled:YES];


}

//滑动页面事件具体实现
- (void)gestures1:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan){
        if(pianyi == 0){
            if([gesture translationInView:gesture.view].x > 0)
            {
                [self.rightDrawerViewController.view setHidden:YES];
                [self.leftDrawerViewController.view setHidden:NO];
            }
            if([gesture translationInView:gesture.view].x < 0)
            {
                [self.rightDrawerViewController.view setHidden:NO];
                [self.leftDrawerViewController.view setHidden:YES];
            }
        }
    }
    
    if(gesture.state == UIGestureRecognizerStateChanged){
        if(pianyi + [gesture translationInView:gesture.view].x > 0)
        {
            [self.rightDrawerViewController.view setHidden:YES];
        }
        if(pianyi + [gesture translationInView:gesture.view].x < 0)
            [self.rightDrawerViewController.view setHidden:NO];
        _mCenterCollectionCtr.transform = CGAffineTransformMakeTranslation(pianyi+[gesture translationInView:gesture.view].x,0);
    }
    if(gesture.state == UIGestureRecognizerStateEnded){
        if(pianyi == 0){
            if([gesture translationInView:gesture.view].x > 0){
                [self translation:240];
                pianyi = 240;
                [gesture2 setEnabled:YES];
            }
            else{
                [self translation:-240];
                pianyi = -240;
                [gesture2 setEnabled:YES];
            }
        }
        
        if(pianyi == 240){
            if([gesture translationInView:gesture.view].x > 0){
                [self translation:240];
                pianyi = 240;
                [gesture2 setEnabled:YES];
            }
            else{
                [self translation:0];
                pianyi = 0;
                [gesture2 setEnabled:NO];
            }
        }
        
        if(pianyi == -240){
            if([gesture translationInView:gesture.view].x > 0){
                [self translation:0];
                pianyi = 0;
                [gesture2 setEnabled:NO];
            }
            else{
                [self translation:-240];
                pianyi = -240;
                [gesture2 setEnabled:YES];
            }
        }
        
        
    }
}

//跳转设置页面
- (void)setBtnClick
{
    [self performSegueWithIdentifier:@"CenterToSetPage" sender:nil];
}

//动画实现
-(void)translation:(CGFloat)x
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"moveView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _mCenterCollectionCtr.transform = CGAffineTransformMakeTranslation(x, 0);
    [UIView commitAnimations];
    
}
#pragma mark - 背景实现
//背景实现
- (void)backgroundImg
{
    WeatherDelegate *weather = [[WeatherDelegate alloc]init];
    [weather readTodayWeatherDictionary];
    NSString *weatherStr= [self wenzichuli:weather.weather];
    if ([weatherStr isEqual: @"晴"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sunny"]];
    if ([weatherStr isEqual: @"雷"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"thunder"]];
    if ([weatherStr isEqual: @"多云"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cloudy"]];
    if ([weatherStr isEqual: @"雨"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rainy"]];
    if ([weatherStr isEqual: @"阵雨"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lightrain3"]];
    if ([weatherStr isEqual: @"阴"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cloudy"]];
    if ([weatherStr isEqual: @"雪"])
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"snow"]];
    if ([weatherStr rangeOfString:@"浮尘"].location != NSNotFound)
    _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dusty"]];
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


@end
