//
//  ImageViewViewController.m
//  tableViewSelected
//
//  Created by ios on 2018/11/16.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ImageViewViewController.h"

@interface ImageViewViewController ()

@end

@implementation ImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView= [[UIImageView alloc]initWithFrame:CGRectMake(50, 50, 200, 300)];
    
    imageView.image = [UIImage imageNamed:@"QR_example"];
    
    [self.view addSubview:imageView];
    // Do any additional setup after loading the view.
}

+
(UIImage *)imageWithClipImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)color
{
    // 图片的宽度和高度
    CGFloat imageWH = image.size.width;
    // 设置圆环的宽度
    CGFloat border = borderWidth;
    // 圆形的宽度和高度
    CGFloat ovalWH = imageWH + 2 * border;
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);
    // 2.画大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];
    [color set];
    [path fill];
    // 3.设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [clipPath addClip];
    // 4.绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    // 5.获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    // 6.关闭上下文
    UIGraphicsEndImageContext();
    return clipImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
