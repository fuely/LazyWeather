//
//  ViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/4/30.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIToolbar *ToolBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *BarItem2;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *BarItem1;
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@end

@implementation ViewController
{
    UIImageView* heartView;
    UIColor* cellcolor;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _mCollectionView.delegate = self;
    _mCollectionView.dataSource = self;
    cellcolor= [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5];
    _BarItem1.title = @"05.02/周一";
    //_BarItem1.tintColor = [UIColor whiteColor];
    _BarItem2.title = @"厦门";
    _BarItem2.tintColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"oneCell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
        {
            UILabel* weatherText = [[UILabel alloc]init];
            weatherText.text =@"今天下雨";
            UIImageView* weatherView = [[UIImageView alloc]initWithFrame:CGRectMake(90.5, 145, 194, 194)];
            if([weatherText.text isEqual: @"今天下雨"]){
                weatherView.image = [UIImage imageNamed:@"oyzy_normal"];
                collectionView.backgroundColor = [UIColor cyanColor];
                collectionView.backgroundView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"rainy"]];

            }
            cell.backgroundColor = cellcolor;
            [cell addSubview:weatherView];
            
            heartView = [[UIImageView alloc]initWithFrame:CGRectMake(284, 135,25,25)];
            heartView.image = [UIImage imageNamed:@"heart"];
            [self minHeart];
            [cell addSubview:heartView];
        }
            break;
        case 1:
        {
            cell.backgroundColor = cellcolor;
            UIImageView* weatherImg = [[UIImageView alloc]initWithFrame:CGRectMake(60, 60, 90, 90)];
            weatherImg.image = [UIImage imageNamed:@"w0"];
            UILabel* weatherLb = [[UILabel alloc]initWithFrame:CGRectMake(65, 150, 80, 30)];
            weatherLb.text = @"阵雨";
            weatherLb.textColor = [UIColor whiteColor];
            weatherLb.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:weatherLb];
            [cell addSubview:weatherImg];
    
            UIImageView* temperatureImg = [[UIImageView alloc]initWithFrame:CGRectMake(225, 60, 90, 90)];
            temperatureImg.image = [UIImage imageNamed:@"w0"];
            UILabel* temperatureLb = [[UILabel alloc]initWithFrame:CGRectMake(230, 150, 80, 30)];
            temperatureLb.text = @"20~23°";
            temperatureLb.textColor = [UIColor whiteColor];
            temperatureLb.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:temperatureLb];
            [cell addSubview:temperatureImg];
            
            UIImageView* pmImg = [[UIImageView alloc]initWithFrame:CGRectMake(60, 220, 90, 90)];
            pmImg.image = [UIImage imageNamed:@"pm25_1"];
            UILabel* pmLb = [[UILabel alloc]initWithFrame:CGRectMake(65, 300, 80, 30)];
            pmLb.text = @"空气 优";
            pmLb.textColor = [UIColor whiteColor];
            pmLb.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:pmLb];
            [cell addSubview:pmImg];
            
            UIImageView* addImg = [[UIImageView alloc]initWithFrame:CGRectMake(225, 220, 90, 90)];
            addImg.image = [UIImage imageNamed:@"add_element"];
            UILabel* addLb = [[UILabel alloc]initWithFrame:CGRectMake(230, 300, 80, 30)];
            addLb.text = @"添加更多";
            addLb.textColor = [UIColor whiteColor];
            addLb.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:addLb];
            [cell addSubview:addImg];

        }
            break;
        default:
            break;
    }
    return  cell;
}

//小图标爱心动画
- (void)minHeart
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    heartView.frame = CGRectMake(284, 135,25,25);
    [UIView commitAnimations];
    [self performSelector:@selector(maxHeart) withObject:nil afterDelay:1.5];
}
- (void)maxHeart
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    heartView.frame = CGRectMake(284, 135,30,30);
    [UIView commitAnimations];
    [self performSelector:@selector(minHeart) withObject:nil afterDelay:0.3];
}
#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    switch (indexPath.row) {
        case 0:
            size = CGSizeMake(375, 450);
            break;
        case 1:
            size = CGSizeMake(375, 400);
            break;
        default:
            size = CGSizeMake(0, 0);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
