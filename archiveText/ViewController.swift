//
//  ViewController.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/21.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let dir = NSHomeDirectory().stringByAppendingPathComponent("Documents");
        let filePath = dir.stringByAppendingPathComponent("data.dat");
        
        //-----------------------
        //データ保存
        //-----------------------
        let nsdic = [
            "name":"name",
            "id":"id",
            "password":"password",
            "mail":"mail"
            ] as NSDictionary
        
        let nsarr = [nsdic,nsdic] as NSArray
        let successful = NSKeyedArchiver.archiveRootObject(nsarr, toFile:filePath);
        if (successful) {
            print("データの保存に成功しました。");
        }
        else{
            print("データの保存に失敗しました。");
        }
        
        //-----------------------
        //復元
        //-----------------------
        let nsarr_ = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! NSArray
        var count = 0
        for elem in nsarr_
        {
            count++
            var json:JSON = JSON(rawValue:elem)!
            print("\(count):", appendNewline: false);
            print(json["name"])
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

