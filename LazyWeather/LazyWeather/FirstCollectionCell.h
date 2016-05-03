//
//  FirstCollectionCell.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIToolbar *centerToolBar;
@property (weak, nonatomic) IBOutlet UIImageView *centerImg;
@property (nonatomic,strong) UIImageView *heartImg;

@end
