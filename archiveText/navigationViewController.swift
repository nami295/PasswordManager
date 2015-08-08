//
//  navigationViewController.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/22.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit

class navigationViewController: UINavigationController, UITableViewDelegate, UITableViewDataSource {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    
    
    
    
    // Tableで使用する配列を定義する.
    //    private let myiPhoneItems: NSArray = ["iOS8", "iOS7", "iOS6", "iOS5", "iOS4"]
    //    private let myAndroidItems: NSArray = ["5.x", "4.x", "2.x", "1.x"]
    
    private var dir = ""
    private var filePath = ""
    private var array = []
    
    // Sectionで使用する配列を定義する.
    //    private let mySections: NSArray = ["iPhone", "Android"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dir = NSHomeDirectory().stringByAppendingPathComponent("Documents");
        filePath = dir.stringByAppendingPathComponent("data.dat");
        
        
        dataSave()
        
        
        array = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as! NSArray
        
        // Status Barの高さを取得を.する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    
    func dataSave(){
        
        //-----------------------
        //データ保存
        //-----------------------
        let nsdic = [
            "name":"namae",
            "id":"id",
            "password":"password",
            "mail":"mail"
            ] as NSDictionary
        
        let nsarr = [
            nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,
            nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,
            nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,nsdic,
            ] as NSArray
        
        //        var json:JSON = JSON(rawValue:nsdic)!
        //        let array = ["a","b"];
        let successful = NSKeyedArchiver.archiveRootObject(nsarr, toFile:filePath);
        if (successful) {
            println("データの保存に成功しました。");
        }
        else{
            println("データの保存に失敗しました。");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    セクションの数を返す.
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //        return mySections.count
        return 1
    }
    
    /*
    セクションのタイトルを返す.
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        return mySections[section] as? String
        return "account"
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var json:JSON = JSON(rawValue:array[indexPath.row])!
        if indexPath.section == 0 {
            println(json["name"])
        }
        //        if indexPath.section == 0 {
        //            println("Value: \(myiPhoneItems[indexPath.row])")
        //        } else if indexPath.section == 1 {
        //            println("Value: \(myAndroidItems[indexPath.row])")
        //        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if section == 0 {
        //            return myiPhoneItems.count
        //        } else if section == 1 {
        //            return myAndroidItems.count
        //        } else {
        //            return 0
        //        }
        
        if section == 0 {
            return array.count
        } else {
            return 0
        }
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! UITableViewCell
        
        var json:JSON = JSON(rawValue:array[indexPath.row])!
        
        
        if indexPath.section == 0 {
            cell.textLabel?.text = json["name"].string
        }
        //        if indexPath.section == 0 {
        //            cell.textLabel?.text = "\(myiPhoneItems[indexPath.row])"
        //        } else if indexPath.section == 1 {
        //            cell.textLabel?.text = "\(myAndroidItems[indexPath.row])"
        //        }
        
        return cell
    }
    
    //    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let label = UILabel(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
    //
    //        // 文字位置
    //        label.textAlignment = NSTextAlignment.Center
    //
    //        // 文字サイズ
    //        label.font = UIFont.italicSystemFontOfSize(21)
    //
    //        // 背景色
    //        label.backgroundColor = UIColor.redColor()
    //
    //        // 文字色
    //        label.textColor =  UIColor.whiteColor()
    //
    //        // 表示される文字
    //        label.text = "タイトル"
    //        
    //        
    //        
    //        
    //        let view = UIView(frame: CGRect(x:0, y:0, width: tableView.bounds.width, height: 50))
    //    
    //        return label
    //        
    //    }


}
