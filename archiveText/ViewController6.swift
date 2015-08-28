//
//  ViewController6.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/23.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit
///個別
class ViewController6: UIViewController {
    
    @IBOutlet weak var titleString: UINavigationItem!
    
    var selectedSectionNum = 0
    var selectedItemNum = 0
    var backUpName = ""
    @IBOutlet weak var nameText: UITextField!//1番目
    @IBOutlet weak var idText: UITextField!//3番目
    @IBOutlet weak var passwordText: UITextField!//4番目
    @IBOutlet weak var mailText: UITextField!//5番目
    @IBOutlet weak var nameKanaText: UITextField!//2番目
    
    @IBAction func nameDidEndOnExit(sender: AnyObject) {
        nameKanaText.becomeFirstResponder();
    }
    
    @IBAction func nameKanaDidEndOnExit(sender: AnyObject) {
        idText.becomeFirstResponder();
    }
    
    @IBAction func idDidEndOnExit(sender: AnyObject) {
        passwordText.becomeFirstResponder();
    }
    
    @IBAction func passwordDidEndOnExit(sender: AnyObject) {
        mailText.becomeFirstResponder();
    }
    
    @IBAction func mailDidEndOnExit(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var changeButton: UIBarButtonItem!
    
    //名前
    @IBAction func editingChanged(sender: AnyObject) {
        do{
            
            let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())
            
            //        let nsSentence: NSString = nameText.text
            let nsSentence: NSString = nameText.text!
            
            //        if let result = GlobalData.regex_yomigana?.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
            if let _ = regex_yomigana.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
            {
                nameKanaText.text=nameText.text
            }
            controlRegisterButton()
        }catch{
        }
    }
    //読みがな
    @IBAction func editingChanged_yomigana(sender: AnyObject) {
        controlRegisterButton()
    }
    func controlRegisterButton(){
        if(nameText == nil || nameText.text == "" || nameKanaText == nil || nameKanaText.text == ""){
            changeButton.enabled = false
        }
        else{
            changeButton.enabled = true
        }
    }
    //変更ボタン
    @IBAction func change(sender: AnyObject) {
        
        
        let tmpArr = GlobalData.getNewList(nameKanaText.text!)
            var editing = tmpArr.count == 0
            if(!editing){
                var json:JSON = JSON(rawValue:tmpArr[0])!
                editing = tmpArr.count == 1 && json["nameKana"].string == backUpName
            }
        
            if(editing){
                do{
                    let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん0-9]*$", options: NSRegularExpressionOptions())
                    
                    
                    //                var nsSentence: NSString = nameKanaText.text
                    let nsSentence: NSString = nameKanaText.text!
//                    nsSentence = (nsSentence as String).substringToIndex(advance((nsSentence as String).startIndex, 1))
                    //                if let result = GlobalData.regex_yomigana?.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
                    if let _ = regex_yomigana.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
                    {
                        //GlobalData.arrayの作り直し
                        GlobalData.refreshList(backUpName,matchValid: false)
                        
                        //セクションごとのarrayの作り直し
                        GlobalData.refreshAllList()
                        
                        let name = nameText.text
                        let nameKana = nameKanaText.text
                        let id = idText.text
                        let password = passwordText.text
                        let mail = mailText.text
                        
                        
                        let add = [
                            "name":name!,
                            "nameKana":nameKana!,
                            "id":id!,
                            "password":password!,
                            "mail":mail!
                            ] as NSDictionary
                        
                        
                        GlobalData.getRefferenceList(
                            nameText.text!.substringToIndex(
                                advance(
                                    nameText.text!.startIndex, 1
                                )
                            )
                            ).addObject(add)
                        
                        let successful = NSKeyedArchiver.archiveRootObject(GlobalData.getAllArray(), toFile:GlobalData.filePath);
                        if (successful) {
                            print("データの追加に成功しました。（データ編集）");
                        }
                        else{
                            print("データの追加に失敗しました。（データ編集）");
                        }
                    }
                    else{
                        showAlert("エラー", mySentence: "読みがなはひらがなまたは英字で入力してください")
                    }
                    
                }catch{
                }
            }
            else{
                showAlert("エラー", mySentence: "その名前はすでに使用されています")
            }
    }
    
    func showAlert(myTitle:String,mySentence:String){
        //UIAlertView
        let alert:UIAlertController = UIAlertController(title:myTitle,
            message: mySentence,
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //Default 複数指定可
        let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction) -> Void in
                
        })
        
        //AlertもActionSheetも同じ
        alert.addAction(defaultAction)
        
        
        //表示。UIAlertControllerはUIViewControllerを継承している。
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteAccount(sender: AnyObject) {
        //UIAlertView
        let alert:UIAlertController = UIAlertController(title:"確認",
            message: "本当に削除しますか？",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //UIActionSheet
//        let actionSheet:UIAlertController = UIAlertController(title:"sheet",
//            message: "actinSheet",
//            preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        //Cancel 一つだけしか指定できない
        let cancelAction:UIAlertAction = UIAlertAction(title: "No",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction) -> Void in
                print("No")
        })
        
        //Default 複数指定可
        let defaultAction:UIAlertAction = UIAlertAction(title: "Yes",
            style: UIAlertActionStyle.Default,
            handler:{
                (action:UIAlertAction) -> Void in
                print("Yes")
                
                //GlobalData.arrayの作り直し
                //name以外のもので作り直す（名前に重複がある場合全て消える）
//                GlobalData.refreshList(self.backUpName,matchValid: false,perfectMatch: false)
                GlobalData.refreshList(self.backUpName,matchValid: false)
                
                //セクションごとのarrayの作り直し
                GlobalData.refreshAllList()
                
                let successful = NSKeyedArchiver.archiveRootObject(GlobalData.getAllArray(), toFile:GlobalData.filePath);
                if (successful) {
                    print("データの追加に成功しました。（データ削除）");
                }
                else{
                    print("データの追加に失敗しました。（データ削除）");
                }
                
                // Segue を呼び出す
                self.performSegueWithIdentifier("toNavigationController",sender: nil)
        })
        
        //AlertもActionSheetも同じ
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        
        
        //表示。UIAlertControllerはUIViewControllerを継承している。
        presentViewController(alert, animated: true, completion: nil)
        
        
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let array_ = GlobalData.getRefferenceList(selectedSectionNum)
        var json:JSON = JSON(rawValue:array_[selectedItemNum])!
        
        //タイトル
        titleString.title = json["name"].string!
        
        nameText.text =     json["name"].string!
        backUpName =        json["nameKana"].string!
        nameKanaText.text = json["nameKana"].string!
        idText.text =       json["id"].string!
        passwordText.text = json["password"].string!
        mailText.text =     json["mail"].string!
        
        controlRegisterButton()

        // Do any additional setup after loading the view.
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
