//
//  ViewController.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewTableViewController.h"
#import "RightTableViewController.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *mCenterCollectionCtr;

@property (nonatomic, strong) LeftViewTableViewController *leftDrawerViewController;
@property (nonatomic, strong) RightTableViewController *rightDrawerViewController;
@property (nonatomic, strong) UICollectionViewController *collectionView;



@end

