//
//  PLMaskAnimationView.m
//  MaskAnimation
//
//  Created by Plan on 15/9/17.
//  Copyright (c) 2015年 PLAN. All rights reserved.
//

#import "PLMaskAnimationView.h"

@implementation PLMaskAnimationView
{
    float _halfViewWidth;
}
- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    [self setupView];
    
    [self installShapeMaskWithRadius:0.0f];
}

- (void)setProgressValue:(float)progress
{
    if (progress >= 0.0 || progress <= 1.0) {
        [self installShapeMaskWithRadius:_halfViewWidth * progress * 1.414];
    }
}

- (void)installShapeMaskWithRadius:(float)radius
{
    self.layer.mask = nil;
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *testPath = [UIBezierPath bezierPathWithRect:self.bounds];
    
    UIBezierPath *counterClockwise = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_halfViewWidth, _halfViewWidth) radius:radius startAngle:0 endAngle:M_PI clockwise:NO];
    [counterClockwise appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(_halfViewWidth, _halfViewWidth) radius:radius startAngle:M_PI endAngle:0 clockwise:NO]];
    [testPath appendPath:counterClockwise];
    
    shapeLayer.fillRule = kCAFillRuleNonZero;
    shapeLayer.path = testPath.CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    self.layer.mask = shapeLayer;
}

- (void)setupView
{
    [self layoutIfNeeded];
    _halfViewWidth = CGRectGetWidth(self.bounds)/2;
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.5];
}

@end
