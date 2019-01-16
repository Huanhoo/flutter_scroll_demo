//
//  ViewController.m
//  Runner
//
//  Created by huan hu on 2019/1/16.
//  Copyright © 2019年 The Chromium Authors. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>

@interface ViewController ()

@end

@implementation ViewController

static NSString *const flutterMethodChannelName = @"com.apple.flutter/flutter_method";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FlutterViewController *fvc = [[FlutterViewController alloc] init];
    [self addChildViewController:fvc];
    [self.view addSubview:fvc.view];
    fvc.view.frame = self.view.bounds;
    
    //Flutter -> Native
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:flutterMethodChannelName binaryMessenger:fvc];
    
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        
        __strong typeof (weakSelf) strongSelf = weakSelf;
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [strongSelf.navigationController pushViewController:vc animated:YES];
        
    }];
    
}


@end
