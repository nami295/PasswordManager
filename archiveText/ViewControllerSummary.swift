//
//  ViewController7.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/06/06.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit
import GoogleMobileAds

//サマリ
class ViewControllerSummary: UIViewController {
    private var bannerView_: GADBannerView!
    let headerHeight:CGFloat = 65;

    override func viewDidLoad() {
        super.viewDidLoad()

        var text = "";
        var total = 0;
        for( var i = 0;i<GlobalData.mySections.count;i++){
            let arr = GlobalData.getRefferenceList(i)
            total += arr.count
        }
        text += NSLocalizedString("sum", comment: "") + "：\(total)" + NSLocalizedString("unit", comment: "") + "\n\n"
        
        var cnt = 0
        
        for(var i = 0;i<GlobalData.sections.count;i++){
            let arr = GlobalData.getRefferenceList(GlobalData.sections[i])
            if(arr.count != 0){
                text += "【\(GlobalData.sections[cnt])】\(arr.count)" + NSLocalizedString("unit", comment: "") + "\n"
            }
            for(var j = 0;j<arr.count;j++){
                //var json:JSON = JSON(rawValue:arr[j])!
                //let name = json["name"].string!
                //let nameKana = json["nameKana"].string!
                //let id = json["id"].string!
                //let password = json["password"].string!
                //let mail = json["mail"].string!
                //let json:Dictionary = arr[j] as NSDictionary
                let json = arr[j] as! NSDictionary
                let name = json["name"] as! NSString
                let nameKana = json["nameKana"] as! NSString
                let id = json["id"] as! NSString
                let password = json["password"] as! NSString
                let mail = json["mail"] as! NSString
//                text += "名前：\(name)\n"
//                text += "読みがな：\(nameKana)\n"
//                text += "ID：\(id)\n"
//                text += "パスワード：\(password)\n"
//                text += "メールアドレス：\(mail)\n\n"
                
                text += NSLocalizedString("name", comment: "") + "：\(name)\n"
                text += NSLocalizedString("kana", comment: "") + "：\(nameKana)\n"
                text += NSLocalizedString("Id", comment: "") + "：\(id)\n"
                text += NSLocalizedString("password", comment: "") + "：\(password)\n"
                text += NSLocalizedString("mailAddress", comment: "") + "：\(mail)\n\n"
            }
            cnt++
        }
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        //バナー広告
        bannerView_ = GADBannerView()
        bannerView_.adUnitID = "ca-app-pub-5418872710464793/7820166668";
        bannerView_.rootViewController = self;
        let request: GADRequest = GADRequest();
        bannerView_.loadRequest(request);
        bannerView_.frame = CGRectMake(0, 0, displayWidth, 40)
        bannerView_.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: headerHeight + bannerView_.frame.height/2)
        if(GlobalData.validAd){
            self.view.addSubview(bannerView_)
        }
        
        //【テキストビュー】
        //「パディング　＝　ヘッダの高さ　＋　バナー広告の高さ」
        //　表示位置Yをパディングとし、テキストビューの高さを「全体高さ　ー　パディング」とする
        
        
        //広告の有無で表示位置を決定する
        var padding = headerHeight
        //広告表示の場合広告バーの高さを足す
        if(GlobalData.validAd){
            padding += bannerView_.frame.height;
        }
        let myTextView = UITextView(
            frame : CGRect(
                x: 0,
                y: padding,
                width: displayWidth,
                height: displayHeight - padding
            )
        )
        myTextView.text = text
        self.view.addSubview(myTextView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
