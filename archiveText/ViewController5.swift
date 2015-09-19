//
//  ViewController5.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/22.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import UIKit
import GoogleMobileAds

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
    
    private var bannerView_: GADBannerView!
    
    //名前
    @IBAction func editingChanged(sender: AnyObject) {
        let nsSentence: NSString = nameText.text!
        //do{//Swift2.0
            //let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())
            let regex_yomigana = NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions(),error: nil)
            if let _ = regex_yomigana!.firstMatchInString(nsSentence as String, options: NSMatchingOptions(), range: NSMakeRange(0, nsSentence.length))
            {
                nameKanaText.text=nameText.text
            }
        //}catch{//Swift2.0
        //}//Swift2.0
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
        
        //バナー広告
        let displayWidth: CGFloat = self.view.frame.width
        bannerView_ = GADBannerView()
        bannerView_.adUnitID = "ca-app-pub-5418872710464793/7820166668";
        bannerView_.rootViewController = self;
        let request: GADRequest = GADRequest();
        bannerView_.loadRequest(request);
        bannerView_.frame = CGRectMake(0, 0, displayWidth, 50)
        bannerView_.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: 90)
        self.view.addSubview(bannerView_)
        
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
        //do{//Swift2.0
            //let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん0-9]*$", options: NSRegularExpressionOptions())//Swift2.0
            let regex_yomigana = NSRegularExpression(pattern: "^[a-zA-Zあ-ん0-9]*$", options: NSRegularExpressionOptions(),error: nil)
        
            let tmpArr = GlobalData.getNewList(text: nameKanaText.text!)
            if(tmpArr.count == 0){
                let nsSentence: NSString = nameKanaText.text!
                if let _ = regex_yomigana!.firstMatchInString(
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
                        
                    NSKeyedArchiver.archiveRootObject(GlobalData.getAllArray(), toFile:GlobalData.filePath);
                        
//                    let successful = NSKeyedArchiver.archiveRootObject(
//                        GlobalData.getAllArray(), toFile:GlobalData.filePath
//                    );
//                    
//                    if (successful) {
//                        print("データの追加に成功しました。（新規登録）");
//                    }
//                    else{
//                        print("データの追加に失敗しました。（新規登録）");
//                    }
                }
                else{
                    showAlert(NSLocalizedString("error_title", comment: ""), mySentence: NSLocalizedString("error_sentence1", comment: ""))
                }
            }
            else{
                showAlert(NSLocalizedString("error_title", comment: ""), mySentence: NSLocalizedString("error_sentence2", comment: ""))
            }
        //}catch{//Swift2.0
        //}//Swift2.0
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
                (action:UIAlertAction!) -> Void in
                
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
