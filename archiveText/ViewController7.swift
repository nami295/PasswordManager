//
//  ViewController7.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/06/06.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit
//サマリ
class ViewController7: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var text = "";
        var total = 0;
        for( var i = 0;i<GlobalData.mySections.count;i++){
            let arr = GlobalData.getRefferenceList(i)
            total += arr.count
        }
        text += "合計：\(total)件\n\n"
        
        var cnt = 0
        
        for(var i = 0;i<GlobalData.sections.count;i++){
            let arr = GlobalData.getRefferenceList(GlobalData.sections[i])
            if(arr.count != 0){
                text += "【\(GlobalData.sections[cnt])】\(arr.count)件\n"
            }
            for(var j = 0;j<arr.count;j++){
                var json:JSON = JSON(rawValue:arr[j])!
                let name = json["name"].string!
                let nameKana = json["nameKana"].string!
                let id = json["id"].string!
                let password = json["password"].string!
                let mail = json["mail"].string!
                text += "名前：\(name)\n"
                text += "読みがな：\(nameKana)\n"
                text += "ID：\(id)\n"
                text += "パスワード：\(password)\n"
                text += "メールアドレス：\(mail)\n\n"
            }
            cnt++
        }
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let myTextView = UITextView()
        myTextView.frame = CGRectMake(0, 0, displayWidth, displayHeight)
        myTextView.text = text
        
//        let myScrollView = UIScrollView()
//        myScrollView.frame = CGRectMake(0, 0, displayWidth, displayHeight)
//        myScrollView.addSubview(myTextView)
//        myScrollView.keyboardDismissMode
        
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
