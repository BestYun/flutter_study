//
//  RCVideoPlayerPlugin.m
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "RCVideoPlayerViewPlugin.h"
#import "RCVideoPlayerViewFactory.h"


@implementation RCVideoPlayerViewPlugin


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    RCVideoPlayerViewFactory *factory = [[RCVideoPlayerViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:factory withId:@"com.readchen.plugs/video_player"];
}

-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    
}

@end
