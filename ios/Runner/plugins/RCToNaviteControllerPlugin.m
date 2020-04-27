//
//  RCToNaviteControllerPlugin.m
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "RCToNaviteControllerPlugin.h"

@implementation RCToNaviteControllerPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
        methodChannelWithName:@"com.readchen/goToNativePage"
              binaryMessenger:[registrar messenger]];
    
    RCToNaviteControllerPlugin* instance = [[RCToNaviteControllerPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    //    注册Applegate
    [registrar addApplicationDelegate:instance];

}
-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    NSLog(@"%@", call.method);
        
        //接收从flutter传递过来的参数
        NSLog(@"%@", call.arguments[@"test"]);

        if ([@"goToNativePage" isEqualToString:call.method]) {
            //实现跳转的代码
//            [self.navigationController pushViewController:[RCVideoPlayController new] animated:YES];
        } else {
            result(FlutterMethodNotImplemented);
        }

}

@end
