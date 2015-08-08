//
//  ViewController.swift
//  UIKit019
//

import UIKit
///一覧
class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    var selectedSectionNum = 0
    var selectedItemNum = 0
    
    private var mySearchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalData.dir = NSHomeDirectory().stringByAppendingPathComponent("Documents");
        GlobalData.filePath = GlobalData.dir.stringByAppendingPathComponent("data.dat");
        
        let fm = NSFileManager.defaultManager()
        if(!fm.fileExistsAtPath(GlobalData.filePath)){
            let arr = GlobalData.getAllArray()
            
            let successful = NSKeyedArchiver.archiveRootObject(arr, toFile:GlobalData.filePath);
            if (successful) {
                print("データの追加に成功しました。（ファイル存在チェック）");
            }
            else{
                print("データの追加に失敗しました。（ファイル存在チェック）");
            }
        }
        GlobalData.array = NSKeyedUnarchiver.unarchiveObjectWithFile(GlobalData.filePath) as! NSArray
        
        GlobalData.refreshAllList()
        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRectMake(0, 0, displayWidth, 116)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 90)
        mySearchBar.showsCancelButton = true
        mySearchBar.showsBookmarkButton = false
        mySearchBar.searchBarStyle = UISearchBarStyle.Default
        mySearchBar.placeholder = "検索"
        mySearchBar.tintColor = UIColor.redColor()
        self.view.addSubview(mySearchBar)
        createTableView()
    }
    func createTableView(){
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let myTableView: UITableView = UITableView(frame: CGRect(x: 0, y: mySearchBar.frame.height, width: displayWidth, height: displayHeight - mySearchBar.frame.height))
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
        print("section index[\(section)]  section name[\(GlobalData.mySections[section])]")
        return GlobalData.mySections[section] as? String
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var json:JSON = JSON(rawValue:GlobalData.getRefferenceList(indexPath.section)[indexPath.row])!
        
//        var json:JSON = JSON(rawValue:GlobalData.getRefferenceList(indexPath.section)[indexPath.row])!
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
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as UITableViewCell
        var json:JSON = JSON(rawValue:GlobalData.getRefferenceList(indexPath.section)[indexPath.row])!
        cell.textLabel?.text = json["name"].string
        return cell
    }
    /*
    テキストが変更される毎に呼ばれる
    */
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
//        var text = searchText
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
    }
    
    /*
    Searchボタンが押された時に呼ばれる
    */
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print("Searching", appendNewline: false)
//        mySearchBar.text = ""
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
//        for (myView: UIView) in views as! [UIView]
        
        for myView: UIView in views
        {
            
            if myView.isKindOfClass(UITableView) {
                myView.removeFromSuperview()
            }
        }
        
        //UITableViewの生成
        createTableView()
    }
    
}