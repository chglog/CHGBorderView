//
//  CHG_BorderV.m
//  ChatBird
//
//  Created by 嘉爸爸 on 2024/6/21.
//

#import "CHG_BorderV.h"

@implementation CHG_BorderV

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 清除之前的边框层
    for (CALayer *layer in [self.layer.sublayers copy]) {
        if ([layer.name isEqualToString:@"borderLayer"]) {
            [layer removeFromSuperlayer];
        }
    }

    // 移除之前的掩码层
    self.layer.mask = nil;

    // 创建形状图层
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.name = @"borderLayer";
    UIBezierPath *borderPath = [UIBezierPath bezierPath];

    CGFloat lineWidth = self.borderWidth / 2.0;

    // 上边框
    if (self.borderType & CHG_BorderTypeTop) {
        if (self.isFirstCell) {
            [borderPath moveToPoint:CGPointMake(lineWidth, self.cornerRadius)];
            [borderPath addArcWithCenter:CGPointMake(self.cornerRadius, self.cornerRadius)
                                  radius:self.cornerRadius - lineWidth
                              startAngle:M_PI
                                endAngle:3 * M_PI_2
                               clockwise:YES];
            [borderPath addLineToPoint:CGPointMake(self.bounds.size.width - self.cornerRadius, lineWidth)];
            [borderPath addArcWithCenter:CGPointMake(self.bounds.size.width - self.cornerRadius, self.cornerRadius)
                                  radius:self.cornerRadius - lineWidth
                              startAngle:3 * M_PI_2
                                endAngle:0
                               clockwise:YES];
        } else {
            [borderPath moveToPoint:CGPointMake(lineWidth, lineWidth)];
            [borderPath addLineToPoint:CGPointMake(self.bounds.size.width - lineWidth, lineWidth)];
        }
    }

    // 下边框
    if (self.borderType & CHG_BorderTypeBottom) {
        if (self.isLastCell) {
            [borderPath moveToPoint:CGPointMake(self.bounds.size.width - lineWidth, self.bounds.size.height - self.cornerRadius)];
            [borderPath addArcWithCenter:CGPointMake(self.bounds.size.width - self.cornerRadius, self.bounds.size.height - self.cornerRadius)
                                  radius:self.cornerRadius - lineWidth
                              startAngle:0
                                endAngle:M_PI_2
                               clockwise:YES];
            [borderPath addLineToPoint:CGPointMake(self.cornerRadius, self.bounds.size.height - lineWidth)];
            [borderPath addArcWithCenter:CGPointMake(self.cornerRadius, self.bounds.size.height - self.cornerRadius)
                                  radius:self.cornerRadius - lineWidth
                              startAngle:M_PI_2
                                endAngle:M_PI
                               clockwise:YES];
        } else {
            [borderPath moveToPoint:CGPointMake(lineWidth, self.bounds.size.height - lineWidth)];
            [borderPath addLineToPoint:CGPointMake(self.bounds.size.width - lineWidth, self.bounds.size.height - lineWidth)];
        }
    }

    // 左边框
    if (self.borderType & CHG_BorderTypeLeft) {
        [borderPath moveToPoint:CGPointMake(lineWidth, (self.isFirstCell ? self.cornerRadius : 0))];
        [borderPath addLineToPoint:CGPointMake(lineWidth, self.bounds.size.height - (self.isLastCell ? self.cornerRadius : 0))];
    }

    // 右边框
    if (self.borderType & CHG_BorderTypeRight) {
        [borderPath moveToPoint:CGPointMake(self.bounds.size.width - lineWidth, (self.isFirstCell ? self.cornerRadius : 0))];
        [borderPath addLineToPoint:CGPointMake(self.bounds.size.width - lineWidth, self.bounds.size.height - (self.isLastCell ? self.cornerRadius : 0))];
    }

    // 设置边框层
    borderLayer.path = borderPath.CGPath;
    borderLayer.strokeColor = self.borderColor.CGColor;
    borderLayer.lineWidth = self.borderWidth;
    borderLayer.fillColor = [UIColor clearColor].CGColor;

    [self.layer addSublayer:borderLayer];
    
    // 判断是否需要裁剪上方/下方圆角
    if (self.isFirstCell || self.isLastCell) {
        UIRectCorner rectCorners = 0;
        if (self.isFirstCell) {
            rectCorners |= UIRectCornerTopLeft | UIRectCornerTopRight;
        }
        if (self.isLastCell) {
            rectCorners |= UIRectCornerBottomLeft | UIRectCornerBottomRight;
        }

        if (rectCorners) {
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
            maskLayer.path = maskPath.CGPath;

            // 设置掩码
            self.layer.mask = maskLayer;
        }
    }
}

@end
