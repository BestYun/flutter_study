//
//  RCVideoPlayerViewController.h
//  Runner
//
//  Created by yun on 2020/4/19.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RCVideoPlayerViewController : NSObject<FlutterPlatformView>
- (instancetype)initWithWithFrame:(CGRect)frame
 viewIdentifier:(int64_t)viewId
      arguments:(id _Nullable)args
binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;


@end

NS_ASSUME_NONNULL_END
