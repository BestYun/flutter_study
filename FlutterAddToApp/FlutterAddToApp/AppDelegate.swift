//
//  AppDelegate.swift
//  FlutterAddToApp
//
//  Created by yun on 2024/2/5.
//

import UIKit
import Flutter
// The following library connects plugins with iOS platform code to this app.
import FlutterPluginRegistrant

@main
class AppDelegate:  FlutterAppDelegate {

    lazy var flutterEngine = FlutterEngine(name: "FlutterEngineName")


    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        flutterEngine.run();
        GeneratedPluginRegistrant.register(with: self.flutterEngine);

        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
    }

 


}

