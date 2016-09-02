//
//  ViewController.m
//  IPASourceCode
//
//  Created by wlpiaoyi on 15/10/21.
//  Copyright © 2015年 wlpiaoyi. All rights reserved.
//

#import "ViewController.h"
#import <Utile/PYOrientationListener.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[PYOrientationListener instanceSingle] isSupportOrientation:UIDeviceOrientationPortrait];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
