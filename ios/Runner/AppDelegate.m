#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "RCVideoPlayController.h"
#import "RCToNaviteControllerPlugin.h"
#import "RCVideoPlayerViewPlugin.h"

@interface AppDelegate()

@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.window makeKeyAndVisible];
    
    [RCToNaviteControllerPlugin registerWithRegistrar:[controller registrarForPlugin:@"RCToNaviteControllerPlugin"]];
    [RCVideoPlayerViewPlugin registerWithRegistrar:[controller registrarForPlugin:@"RCVideoPlayerViewPlugin"]];


//     FlutterMethodChannel* batteryChannel = [FlutterMethodChannel
//                                             methodChannelWithName:@"com.readchen/goToNativePage"
//                                             binaryMessenger:controller];
//
//
//
//     [batteryChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
//       // TODO
//         NSLog(@"%@", call.method);
//
//             //接收从flutter传递过来的参数
//             NSLog(@"%@", call.arguments[@"test"]);
//
//             if ([@"goToNativePage" isEqualToString:call.method]) {
//                 //实现跳转的代码
//                 [self.navigationController pushViewController:[RCVideoPlayController new] animated:YES];
//             } else {
//                 result(FlutterMethodNotImplemented);
//             }
//
//     }];
    
    
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
