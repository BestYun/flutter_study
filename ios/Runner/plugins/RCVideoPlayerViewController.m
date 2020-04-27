//
//  RCVideoPlayerViewController.m
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "RCVideoPlayerViewController.h"

@interface RCVideoPlayerViewController()

@end

@implementation RCVideoPlayerViewController{
    UIView * _videoView;
    int64_t _viewId;
    FlutterMethodChannel* _channel;

}

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
  if ([super init]) {
    _viewId = viewId;
    _videoView = [UIView new];
    _videoView.backgroundColor = [UIColor blueColor];


    NSString* channelName = [NSString stringWithFormat:@"bms_video_player_%lld", viewId];
      
    _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
    __weak __typeof__(self) weakSelf = self;
    [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        [weakSelf onMethodCall:call result:result];
    }];

  }
  return self;
}

-(UIView *)view{
    return _videoView;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSLog(@"onMethodCall");
  if ([[call method] isEqualToString:@"loadUrl"]) {

  } else {
    result(FlutterMethodNotImplemented);
  }
}


@end
