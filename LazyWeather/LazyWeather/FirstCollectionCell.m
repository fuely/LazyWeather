//
//  FirstCollectionCell.m
//  LazyWeather
//
//  Created by 傅韩建 on 16/5/2.
//  Copyright © 2016年 HanJian-F. All rights reserved.
//

#import "FirstCollectionCell.h"

@implementation FirstCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.3];
    self.centerImg.image = [UIImage imageNamed:@"bxlx_normal"];
    self.centerImg.image = [UIImage imageNamed:@"bxlx_normal"];
    self.centerToolBar.items[1].title = @"05.02/周一";
    self.centerToolBar.items[1].tintColor = [UIColor whiteColor];
    self.centerToolBar.items[3].title = @"厦门";
    self.centerToolBar.items[3].tintColor = [UIColor whiteColor];
    self.heartBtn = [[UIButton alloc]initWithFrame:CGRectMake(285, 167, 24, 24)];
    [self.heartBtn setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    [self.heartBtn addTarget:self action:@selector(heartClick:) forControlEvents:UIControlEventTouchUpInside];
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(animate) userInfo:nil repeats:true];
    [self addSubview:self.heartBtn];
    [self addItems:self withAddOfNumber:0];
}

//小爱心事件
- (void)heartClick:(id)sender{
    
}

- (void)animate{
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.fromValue = [NSNumber numberWithFloat:1.0];
    pulse.toValue = [NSNumber numberWithFloat:1.4];
    pulse.duration = 0.3;
    pulse.autoreverses = YES;
    pulse.fillMode = kCAFillModeForwards;
    [self.heartBtn.layer addAnimation:pulse forKey:@"pulse"];
}

# define btntag 100
# define lbtag  200
- (void)addItems:(UICollectionViewCell *)cell withAddOfNumber:(int)number{
    
    for (int i = 0; i<15; i++) {
        
        UIButton* btnItem = [[UIButton alloc]init];
        UILabel* lbtitle = [[UILabel alloc]init];
        if (i<4+number) {
            float x = 80 + i%2*(120 +20);
            float y = 500 + i/2*(120 +80);
            btnItem.frame = CGRectMake(x, y,80, 80);
            lbtitle.frame = CGRectMake(x, y+80, 80, 40);
            lbtitle.textColor = [UIColor whiteColor];
            lbtitle.textAlignment = NSTextAlignmentCenter;
            btnItem.tintColor = [UIColor whiteColor];
            lbtitle.tag = i+1+lbtag;
            btnItem.tag = i+1+btntag;
            [cell addSubview:btnItem];
            [cell addSubview:lbtitle];
        }
        else
        {
            float x = 80 + i%2*(80 +60);
            float y = 500 + i/2*(80 +120);
            btnItem.frame = CGRectMake(x, y,80, 80);
            lbtitle.frame = CGRectMake(x, y+80, 80, 40);
            lbtitle.textColor = [UIColor whiteColor];
            lbtitle.textAlignment = NSTextAlignmentCenter;
            btnItem.tintColor = [UIColor whiteColor];
            lbtitle.tag = i+1+lbtag;
            btnItem.tag = i+1+btntag;
        }
    }
    UIButton* itemsImg = [[UIButton alloc]init];
    UILabel* itemslb = [[UILabel alloc]init];
    
    itemsImg = (UIButton *)[cell viewWithTag:1+btntag];
    [itemsImg setImage:[UIImage imageNamed:@"w2"] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:1+lbtag];
    itemslb.text = @"阴";
    
    itemsImg = (UIButton *)[cell viewWithTag:2+btntag];
    [itemsImg setTitle:@"24" forState:UIControlStateNormal];
    itemsImg.titleLabel.font = [UIFont boldSystemFontOfSize:60];
    itemslb = (UILabel *)[cell viewWithTag:2+lbtag];
    itemslb.text = @"21~25°";
    
    itemsImg = (UIButton *)[cell viewWithTag:3+btntag];
    [itemsImg setImage:[UIImage imageNamed:@"pm25_1"] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:3+lbtag];
    itemslb.text = @"空气 优";
    
    itemsImg = (UIButton *)[cell viewWithTag:number+4+btntag];
    [itemsImg setImage:[UIImage imageNamed:@"add_element"] forState:UIControlStateNormal];
    itemslb = (UILabel *)[cell viewWithTag:number+4+lbtag];
    itemslb.text = @"添加更多";
    
    
}


@end
