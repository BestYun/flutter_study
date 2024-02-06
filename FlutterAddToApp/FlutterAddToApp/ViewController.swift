//
//  ViewController.swift
//  FlutterAddToApp
//
//  Created by yun on 2024/2/5.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.title = "native home"
    }


    @IBAction func pushFlutterPageClick(_ sender: Any) {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        
        let flutterViewController =
               FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        navigationController?.pushViewController(flutterViewController, animated: true)
        
        
    }
}

