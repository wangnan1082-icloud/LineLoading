//
//  UIView+LineLoading.m
//  LineLoading
//
//  Created by 王楠 on 2018/12/5.
//  Copyright © 2018年 王楠. All rights reserved.
//

#import "UIView+LineLoading.h"
#import <objc/runtime.h>

static NSString *lineColorKey = @"lineColorKey";
static NSString *lineWidthKey = @"lineWidthKey";

@implementation UIView (LineLoading)

#pragma mark - Method

- (void)startLoading {
    if (self.lineWidth  == 0) {
        self.lineWidth = 3;
    }
    if (!self.lineColor) {
        self.lineColor = [UIColor redColor];
    }
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    [lineLayer setName:@"lineLayer"];
    lineLayer.fillColor = nil;
    lineLayer.lineWidth =  self.lineWidth;
    lineLayer.lineCap = kCALineCapSquare;
    lineLayer.strokeColor = self.lineColor.CGColor;
    [self.layer addSublayer:lineLayer];
    // 添加路径曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [path closePath];
    lineLayer.path = path.CGPath;
    // 创建Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    animation.duration = 3.0;
    animation.repeatCount = HUGE_VALF;
    // 设置layer的animation
    [lineLayer addAnimation:animation forKey:nil];
}

- (void)stopLoading {
    // 移除layer
    for (CALayer *layer in self.layer.sublayers) {
        if ([layer.name isEqualToString:@"lineLayer"]) {
            [layer removeFromSuperlayer];
            [layer removeAllAnimations];
        }
    }
}

#pragma mark -

- (void)setLineColor:(UIColor *)lineColor {
    objc_setAssociatedObject(self, &lineColorKey, lineColor, OBJC_ASSOCIATION_RETAIN);
}

- (UIColor *)lineColor {
    return objc_getAssociatedObject(self, &lineColorKey);
}

- (void)setLineWidth:(CGFloat)lineWidth {
    objc_setAssociatedObject(self, &lineWidthKey, @(lineWidth), OBJC_ASSOCIATION_ASSIGN);
}

- (CGFloat)lineWidth {
    return [objc_getAssociatedObject(self, &lineWidthKey) floatValue];
}

@end
