//
//  DrawView.m
//  DrawView
//
//  Created by aDu on 2017/7/22.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (!self.backColor) {
        self.backColor = [UIColor redColor];
    }
    [self.backColor set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 1.8;
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path moveToPoint:CGPointMake(11.0, 10.0)];//起点
    
    // Draw the lines
    [path addLineToPoint:CGPointMake(1.0, 20.0)];
    [path addLineToPoint:CGPointMake(11.0, 30.0)];
    [path stroke];//Draws line 根据坐标点连线
    
    UILabel *backLabel = [[UILabel alloc] init];
    backLabel.text = @"返回";
    backLabel.frame = CGRectMake(13, 0, 40, 40);
    backLabel.font = [UIFont systemFontOfSize:17];
    backLabel.textColor = self.backColor;
    [self addSubview:backLabel];
}

@end
