//
//  ViewController5.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/22.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit
///新規登録
class ViewController5: UIViewController {
    
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
    
    @IBOutlet weak var registrButton: UIBarButtonItem!
    
    //名前
    @IBAction func editingChanged(sender: AnyObject) {
        
//        let nsSentence: NSString = nameText.text
        let nsSentence: NSString = nameText.text!
//        if let result = GlobalData.regex_yomigana?.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
        
        do{
            let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())
            if let _ = regex_yomigana.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
            {
                nameKanaText.text=nameText.text
            }
        }catch{
        }
        controlRegisterButton()
    }
    
    //読みがな
    @IBAction func editingChanged_yomigana(sender: AnyObject) {
        controlRegisterButton()
    }
    func controlRegisterButton(){
        if(nameText == nil || nameText.text == "" || nameKanaText == nil || nameKanaText.text == ""){
            registrButton.enabled = false
        }
        else{
            registrButton.enabled = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        controlRegisterButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAccount(sender: AnyObject) {
        dataSave()
    }
    
    func dataSave(){
        do{
            let regex_yomigana =
                try NSRegularExpression(
                    pattern: "^[a-zA-Zあ-ん0-9]*$",
                    options: NSRegularExpressionOptions()
                )
            
            let tmpArr = GlobalData.getNewList(nameKanaText.text!)
            if(tmpArr.count == 0){
//                var nsSentence: NSString = nameKanaText.text
                let nsSentence: NSString = nameKanaText.text!
//                nsSentence = (nsSentence as String).substringToIndex(
//                    advance((nsSentence as String).startIndex, 1))
                
                if let _ = regex_yomigana.firstMatchInString(
                    nsSentence as String,
                    options: NSMatchingOptions(),
                    range: NSMakeRange(0, nsSentence.length)
                    ){
                            
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
                        
                    
                    //GlobalData.arrayの作り直し
                    GlobalData.refreshList(all:true)
                    
                    //セクションごとのarrayの作り直し
                    GlobalData.refreshAllList()
                    
                    GlobalData.getRefferenceList(
                        nameText.text!.substringToIndex(
                            advance(nameText.text!.startIndex, 1)
                        )
                        ).addObject(add)
                    
                    let successful = NSKeyedArchiver.archiveRootObject(
                        GlobalData.getAllArray(), toFile:GlobalData.filePath
                    );
                    
                    if (successful) {
                        print("データの追加に成功しました。（新規登録）");
                    }
                    else{
                        print("データの追加に失敗しました。（新規登録）");
                    }
                }
                else{
                    showAlert("エラー", mySentence: "読みがなはひらがなまたは英字で入力してください")
                }
            }
            else{
                showAlert("エラー", mySentence: "その名前はすでに使用されています")
            }
        }catch{
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
