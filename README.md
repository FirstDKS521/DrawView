#iOS开发：改变返回按钮的颜色、搜索框的简单使用

![效果GIF.gif](http://upload-images.jianshu.io/upload_images/1840399-348bfa8a6a05d3b6.gif?imageMogr2/auto-orient/strip)

项目中使用到了web页面，由于web页面可能背景色不同，想要使导航栏的背景色和web的背景色一致，此时返回按钮的文案颜色以及‘返回箭头’颜色可能也需要改变；

`返回箭头`和`返回`我是自定义了一个View，然后把自定义的View转换成图片作为按钮的背景图，而按钮又作为返回按钮`leftBarButtonItem`，返回箭头我是通过UIBezierPath画出来的；下面是返回箭头的绘制：

```
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
```
UIView转换成Image的方法：

```
- (UIImage *)viewToImage:(UIView *)view {
    CGSize size = view.bounds.size;
    // 下面的方法：第一个参数表示区域大小；第二个参数表示是否是非透明的如果需要显示半透明效果，需要传NO，否则传YES；第三个参数是屏幕密度
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
```
[简书地址](http://www.jianshu.com/p/35bddb83cd14)