//
//  ViewController.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "ViewController.h"
#import "FirstCollectionCell.h"
#import "LeftViewTableViewController.h"
#import "RightTableViewController.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mCenterCollectionCtr;


@end


@implementation ViewController
{
    CGFloat pianyi;
    UITapGestureRecognizer *gesture2;
}

static NSString * const reuseIdentifier = @"FirstCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置_mCenterCollectionCtr代理,加载cell
    _mCenterCollectionCtr.delegate = self;
    _mCenterCollectionCtr.dataSource = self;
    
    //左右页面初始化
    [self addLeftViewwithRightView];

    

}

#pragma mark - UICollectionViewDataSource
//定义展示的Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//定义展示的cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //注册cell与Xib
    [_mCenterCollectionCtr registerClass:[FirstCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    UINib *nib = [UINib nibWithNibName:@"FirstCollectionCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:reuseIdentifier];
    //实例化cell
    UICollectionViewCell *cell = [[UICollectionViewCell alloc]init];
    FirstCollectionCell *firstCell =[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
        {
            _mCenterCollectionCtr.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rainy"]];
            firstCell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5];
            firstCell.centerImg.image = [UIImage imageNamed:@"bxlx_normal"];
            firstCell.centerToolBar.items[1].title = @"05.02/周一";
            firstCell.centerToolBar.items[1].tintColor = [UIColor whiteColor];
            firstCell.centerToolBar.items[3].title = @"厦门";
            firstCell.centerToolBar.items[3].tintColor = [UIColor whiteColor];
            firstCell.heartImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart"]];
            firstCell.heartImg.center = CGPointMake(285, 167);
            [firstCell addSubview:firstCell.heartImg];
            cell = firstCell;
        
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}
#pragma mark - UICollectionViewDelegate

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    switch (indexPath.row) {
        case 0:
            size = CGSizeMake(375, 1334);
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




#pragma mark - 滑动页面事件
- (void)addLeftViewwithRightView
{
    //滑动手势初始化设置
    UIPanGestureRecognizer *gesture1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestures1:)];
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

//滑动页面事件具体实现
- (void)gestures1:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state == UIGestureRecognizerStateBegan){
        if(pianyi == 0){
            if([gesture translationInView:gesture.view].x > 0)
                [self.rightDrawerViewController.view setHidden:YES];
            if([gesture translationInView:gesture.view].x < 0)
                [self.rightDrawerViewController.view setHidden:NO];
        }
    }
    
    if(gesture.state == UIGestureRecognizerStateChanged){
        if(pianyi + [gesture translationInView:gesture.view].x > 0)
            [self.rightDrawerViewController.view setHidden:YES];
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

//动画实现
-(void)translation:(CGFloat)x
{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"moveView" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _mCenterCollectionCtr.transform = CGAffineTransformMakeTranslation(x, 0);
    [UIView commitAnimations];
    
}


@end
