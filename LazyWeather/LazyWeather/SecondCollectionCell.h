//
//  SecondCollectionCell.h
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/3.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCollectionCell : UICollectionViewCell

@property (nonatomic,strong) UILabel* toplb;
@property (nonatomic,strong) UIButton* setBtn;

@property (nonatomic,strong) UILabel* airView;
@property (nonatomic,strong) UILabel* airlb;
@property (nonatomic,strong) UILabel* airText;
@property (nonatomic,strong) UIImageView* volumeBar;
@property (nonatomic,strong) UIImageView* volumePoint;

@property (nonatomic,strong) UILabel* pm10;
@property (nonatomic,strong) UILabel* pm2;
@property (nonatomic,strong) UILabel* no2;
@property (nonatomic,strong) UILabel* so2;
@property (nonatomic,strong) UILabel* o3;
@property (nonatomic,strong) UILabel* co;




@end
