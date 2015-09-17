//
//  ViewController.m
//  MaskAnimation
//
//  Created by Plan on 15/9/17.
//  Copyright (c) 2015年 PLAN. All rights reserved.
//

#import "ViewController.h"
#import "PLMaskAnimationView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PLMaskAnimationView *maskAnimationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

- (void)onTimer
{
    static float index = 0.f;
    [_maskAnimationView setProgressValue:index];
    index += .01;
    NSLog(@"what are u doing");
    if (index > 2.0) {
        index = 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
