//
//  ViewController.swift
//  UIKit019
//

import UIKit
import GoogleMobileAds

///一覧
class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    var selectedSectionNum = 0
    var selectedItemNum = 0
    
    private var mySearchBar: UISearchBar!
    private var bannerView_: GADBannerView!
    
    override func viewDidLoad() {
        
//        print(GoogleMobileAds.GADRequest.sdkVersion);
        super.viewDidLoad()
        
        
        //GlobalData.dir = NSHomeDirectory().stringByAppendingPathComponent("Documents");
        //GlobalData.filePath = GlobalData.dir.stringByAppendingPathComponent("data.dat");
        let dir = NSURL(fileURLWithPath: NSHomeDirectory()).URLByAppendingPathComponent("Documents").path!
        let path = NSURL(fileURLWithPath: dir).URLByAppendingPathComponent("data.dat").path!
        GlobalData.dir = dir
        GlobalData.filePath = path
        
        
        
        let fm = NSFileManager.defaultManager()
        if(!fm.fileExistsAtPath(GlobalData.filePath)){
            let arr = GlobalData.getAllArray()
            
            NSKeyedArchiver.archiveRootObject(arr, toFile:GlobalData.filePath);
//            let successful = NSKeyedArchiver.archiveRootObject(arr, toFile:GlobalData.filePath);
//            if (successful) {
//                print("データの追加に成功しました。（ファイル存在チェック）");
//            }
//            else{
//                print("データの追加に失敗しました。（ファイル存在チェック）");
//            }
        }
        GlobalData.array = NSKeyedUnarchiver.unarchiveObjectWithFile(GlobalData.filePath) as! NSArray
        
        GlobalData.refreshAllList()
        let displayWidth: CGFloat = self.view.frame.width
        
        //バナー広告
        bannerView_ = GADBannerView()
        bannerView_.adUnitID = "ca-app-pub-5418872710464793/7820166668";
        bannerView_.rootViewController = self;
        let request: GADRequest = GADRequest();
        bannerView_.loadRequest(request);
        bannerView_.frame = CGRectMake(0, 0, displayWidth, 50)
        bannerView_.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: 90)
        
        //検索バー
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRectMake(0, 0, displayWidth, 50)
        mySearchBar.layer.position = CGPoint(
            x: self.view.bounds.width/2,
            y: (90 + bannerView_.frame.height)
        )
        mySearchBar.showsCancelButton = true
        mySearchBar.showsBookmarkButton = false
        mySearchBar.searchBarStyle = UISearchBarStyle.Default
        mySearchBar.placeholder = NSLocalizedString("search", comment: "")
        mySearchBar.tintColor = UIColor.redColor()
        self.view.addSubview(mySearchBar)
        self.view.addSubview(bannerView_)
        
        //アカウントリスト
        createTableView()
    }
    
    func createTableView(){
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let padding = 65 + bannerView_.frame.height + mySearchBar.frame.height
        let myTableView: UITableView = UITableView(
            frame: CGRect(
                x: 0,
                y: padding,
                width: displayWidth,
                height: displayHeight - padding
            )
        )
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    セクションの数を返す.
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return GlobalData.mySections.count
    }
    
    /*
    セクションのタイトルを返す.
    */
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print("section index[\(section)]  section name[\(GlobalData.mySections[section])]")
        return GlobalData.mySections[section] as? String
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedSectionNum = indexPath.section
        selectedItemNum = indexPath.row
        performSegueWithIdentifier("toSubViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toSubViewController") {
            let subVC: ViewController6 = segue.destinationViewController as! ViewController6
            subVC.selectedSectionNum = selectedSectionNum
            subVC.selectedItemNum = selectedItemNum
        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalData.getRefferenceList(section).count
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        //var json:JSON = JSON(rawValue:GlobalData.getRefferenceList(indexPath.section)[indexPath.row])!
        //cell.textLabel?.text = json["name"].string
        
        cell.textLabel?.text = GlobalData.getRefferenceList(indexPath.section)[indexPath.row]["name"] as! NSString as String
        return cell
    }
    /*
    テキストが変更される毎に呼ばれる
    */
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText
        if(text == ""){
            refreshList(all:true)
        }
        else{
            refreshList(text,perfectMatch:false)
        }
    }
    
    /*
    Cancelボタンが押された時に呼ばれる
    */
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        mySearchBar.text = ""
        refreshList(all:true)
        self.view.endEditing(true)
    }
    
    /*
    Searchボタンが押された時に呼ばれる
    */
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    /*
    一覧を指定された文字列にマッチするアカウントで更新する
    */
    func refreshList(text:String = "",all:Bool = false,perfectMatch: Bool = true){
        
        //GlobalData.arrayの作り直し
        GlobalData.refreshList(text,all:all,perfectMatch:perfectMatch)
        
        //「セクションごとのarray」の作り直し
        GlobalData.refreshAllList()
        
        //UITableViewの削除
        let views = self.view.subviews
        
        for myView in views
        {
            if myView.isKindOfClass(UITableView) {
                myView.removeFromSuperview()
            }
        }
        
        //UITableViewの生成
        createTableView()
    }
    
}