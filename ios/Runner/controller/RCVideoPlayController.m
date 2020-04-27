//
//  RCVideoPlayController.m
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "RCVideoPlayController.h"

@interface RCVideoPlayController ()

@end

@implementation RCVideoPlayController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    blueView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:blueView];

}

 
@end
