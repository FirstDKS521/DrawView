//
//  BackViewController.m
//  DrawView
//
//  Created by aDu on 2017/7/22.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import "BackViewController.h"
#import "DrawView.h"

@interface BackViewController ()

@property (nonatomic, strong) DrawView *drawView;
@property (nonatomic, strong) UIBarButtonItem *backItem;
@property (nonatomic, strong) UIBarButtonItem *closeItem;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation BackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"自定义返回按钮啦";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.drawView.backColor = [UIColor blueColor];
    [self.closeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.closeItem.customView = _closeBtn;
    self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
}

- (IBAction)changeColor:(id)sender {
    UIColor *color = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
    self.drawView.backColor = color;
    [self.closeBtn setTitleColor:color forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.backItem, self.closeItem];
}

- (void)backNative {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIBarButtonItem *)backItem
{
    _backItem = [[UIBarButtonItem alloc] init];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[self viewToImage:_drawView] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backNative) forControlEvents:UIControlEventTouchUpInside];
    // 让返回按钮内容继续向左边偏移15
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -8, 0, 0);
    backBtn.frame = CGRectMake(0, 0, 35, 40);
    _backItem.customView = backBtn;
    return _backItem;
}

- (DrawView *)drawView {
    _drawView = [[DrawView alloc] initWithFrame:CGRectMake(0, 0, 46, 40)];
    return _drawView;
}

- (UIBarButtonItem *)closeItem
{
    _closeItem = [[UIBarButtonItem alloc] init];
    _closeItem.customView = _closeBtn;
    return _closeItem;
}

- (UIButton *)closeBtn {
    _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [_closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_closeBtn.titleLabel setFont:[UIFont systemFontOfSize:17]];
    _closeBtn.frame = CGRectMake(0, 0, 35, 40);
    return _closeBtn;
}

- (UIImage *)viewToImage:(UIView *)view {
    CGSize size = view.bounds.size;
    // 下面的方法：第一个参数表示区域大小；第二个参数表示是否是非透明的如果需要显示半透明效果，需要传NO，否则传YES；第三个参数是屏幕密度
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
