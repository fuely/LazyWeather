//
//  ThirdCollectionCell.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/3.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "ThirdCollectionCell.h"

@implementation ThirdCollectionCell

- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];

    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _toplb = [[UILabel alloc]initWithFrame:CGRectMake(40, 40, 200, 40)];
        _toplb.text = @"未来5小时>";
        _toplb.font = [UIFont boldSystemFontOfSize:25];
        [self addSubview:_toplb];
        
        _setBtn = [[UIButton alloc]initWithFrame:CGRectMake(315, 45, 25, 25)];
        [_setBtn setImage:[UIImage imageNamed:@"lanmuselect@2x_normal"] forState:UIControlStateNormal];
        [self addSubview:_setBtn];
        
        _btnView = [[UIButton alloc]initWithFrame:CGRectMake(40, 100, 275, 80)];
        _imgClock = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 90, 90)];
        _lbClock = [[UILabel alloc]initWithFrame:CGRectMake(16, 25, 60, 40)];
        
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"HH"];
        NSString *currentTime = [formatter stringFromDate:[NSDate date]];
        _lbClock.text= currentTime;
        _lbClock.textAlignment = NSTextAlignmentCenter;
        _lbClock.textColor = [UIColor whiteColor];
        _imgClock.image = [UIImage imageNamed:@"volumepoint"];
        [_imgClock addSubview:_lbClock];
        [_btnView addSubview:_imgClock];
        
        _lbCloudy = [[UILabel alloc]initWithFrame:CGRectMake(110, 0, 120, 60)];
        _lbrain = [[UILabel alloc]initWithFrame:CGRectMake(110, 40, 200, 30)];
        _lbCloudy.text = @"多云23°";
        _lbCloudy.font = [UIFont boldSystemFontOfSize:27];
        _lbrain.text = @"东北风 一级 14%可能下雨";
        _lbrain.font = [UIFont systemFontOfSize:15];
        [_btnView addSubview:_lbCloudy];
        [_btnView addSubview:_lbrain];
        [self addSubview:_btnView];

        
    }
        return self;
}


@end
