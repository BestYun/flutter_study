//
//  RCVideoPlayerViewFactory.m
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import "RCVideoPlayerViewFactory.h"
#import "RCVideoPlayerViewController.h"

@interface RCVideoPlayerViewFactory()
@property(nonatomic,strong) NSObject<FlutterBinaryMessenger> *messenger;

@end


@implementation RCVideoPlayerViewFactory{
}

- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger> *)messager{
    self = [super init];
    if (self) {
        self.messenger = messager;
    }
    return self;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

 
 - (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame
                                            viewIdentifier:(int64_t)viewId
                                                 arguments:(id _Nullable)args {
    RCVideoPlayerViewController *controller = [[RCVideoPlayerViewController alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args binaryMessenger:_messenger];
    return controller;
}
@end

