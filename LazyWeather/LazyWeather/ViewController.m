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
    UIView* blackview;
}

static NSString * const reuseIdentifier = @"FirstCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置_mCenterCollectionCtr代理,加载cell
    _mCenterCollectionCtr.delegate = self;
    _mCenterCollectionCtr.dataSource = self;
    [_mCenterCollectionCtr registerClass:[FirstCollectionCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    //
    
    //滑动手势初始化设置
    UIPanGestureRecognizer *gesture1 = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(gestures1:)];
    [self.view addGestureRecognizer:gesture1];
    //    self.collectionview1.userInteractionEnabled=NO;
    
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

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


//----------------------
//点击事件
-(void)gestures2:(UITapGestureRecognizer *)gesture
{
    [self translation:0];
    pianyi = 0.0f;
    [gesture setEnabled:NO];
}

//滑动页面事件具体实现
-(void)gestures1:(UIPanGestureRecognizer *)gesture
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
        blackview.transform = CGAffineTransformMakeTranslation(pianyi+[gesture translationInView:gesture.view].x,0);
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
    [UIView beginAnimations:@"moveview" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _mCenterCollectionCtr.transform = CGAffineTransformMakeTranslation(x, 0);
    [UIView commitAnimations];
    
}


@end
