//
//  GlobalData.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/24.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import Foundation

struct GlobalData{
    
    
    static var dir = ""
    static var filePath = ""
    static var array = []
    
    static let sections = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","あ","か","さ","た","な","は","ま","や","ら","わ","other"]
    // Sectionで使用する配列を定義する.
    static var mySections: NSMutableArray = []
    
    static var item_a: NSMutableArray = []
    static var item_b: NSMutableArray = []
    static var item_c: NSMutableArray = []
    static var item_d: NSMutableArray = []
    static var item_e: NSMutableArray = []
    static var item_f: NSMutableArray = []
    static var item_g: NSMutableArray = []
    static var item_h: NSMutableArray = []
    static var item_i: NSMutableArray = []
    static var item_j: NSMutableArray = []
    static var item_k: NSMutableArray = []
    static var item_l: NSMutableArray = []
    static var item_m: NSMutableArray = []
    static var item_n: NSMutableArray = []
    static var item_o: NSMutableArray = []
    static var item_p: NSMutableArray = []
    static var item_q: NSMutableArray = []
    static var item_r: NSMutableArray = []
    static var item_s: NSMutableArray = []
    static var item_t: NSMutableArray = []
    static var item_u: NSMutableArray = []
    static var item_v: NSMutableArray = []
    static var item_w: NSMutableArray = []
    static var item_x: NSMutableArray = []
    static var item_y: NSMutableArray = []
    static var item_z: NSMutableArray = []
    
    static var item_あ: NSMutableArray = []
    static var item_か: NSMutableArray = []
    static var item_さ: NSMutableArray = []
    static var item_た: NSMutableArray = []
    static var item_な: NSMutableArray = []
    static var item_は: NSMutableArray = []
    static var item_ま: NSMutableArray = []
    static var item_や: NSMutableArray = []
    static var item_ら: NSMutableArray = []
    static var item_わ: NSMutableArray = []
    
    static var item_other: NSMutableArray = []
    
    
    
    static func getAllArray() -> NSMutableArray{
        let arr :NSMutableArray = []
        for (var i=0;i<37;i++){
            let a = getRefferenceList_(i)
            for elem in a{
                arr.addObject(elem)
            }
        }
        return arr
    }
    
    static func removeAllArray(){
        for (var i=0;i<37;i++){
            let a = getRefferenceList_(i)
            a.removeAllObjects()
        }
    }
    
    static func getRefferenceList_(num:Int) -> NSMutableArray{
                switch(num){
                case 0:
                    return item_a
                case 1:
                    return item_b
                case 2:
                    return item_c
                case 3:
                    return item_d
                case 4:
                    return item_e
                case 5:
                    return item_f
                case 6:
                    return item_g
                case 7:
                    return item_h
                case 8:
                    return item_i
                case 9:
                    return item_j
                case 10:
                    return item_k
                case 11:
                    return item_l
                case 12:
                    return item_m
                case 13:
                    return item_n
                case 14:
                    return item_o
                case 15:
                    return item_p
                case 16:
                    return item_q
                case 17:
                    return item_r
                case 18:
                    return item_s
                case 19:
                    return item_t
                case 20:
                    return item_u
                case 21:
                    return item_v
                case 22:
                    return item_w
                case 23:
                    return item_x
                case 24:
                    return item_y
                case 25:
                    return item_z
                case 26:
                    return item_あ
                case 27:
                    return item_か
                case 28:
                    return item_さ
                case 29:
                    return item_た
                case 30:
                    return item_な
                case 31:
                    return item_は
                case 32:
                    return item_ま
                case 33:
                    return item_や
                case 34:
                    return item_ら
                case 35:
                    return item_わ
                default:
                    return item_other
                }
    }
    
    static func getRefferenceList(num:Int) -> NSMutableArray{
        let secPrefix: String = mySections[num] as! String
        return getRefferenceList(secPrefix)
    }
    
    
    static func getRefferenceList(str:NSString) -> NSMutableArray{
        //original
//        static let regex_azAZ = NSRegularExpression(pattern: "[a-zA-Z]", options: NSRegularExpressionOptions())
//        static let regex_hira1 = NSRegularExpression(pattern: "[あ-おア-オ]", options: NSRegularExpressionOptions())
//        static let regex_hira2 = NSRegularExpression(pattern: "[か-こカ-コ]", options: NSRegularExpressionOptions())
//        static let regex_hira3 = NSRegularExpression(pattern: "[さ-そサ-ソ]", options: NSRegularExpressionOptions())
//        static let regex_hira4 = NSRegularExpression(pattern: "[た-とタ-ト]", options: NSRegularExpressionOptions())
//        static let regex_hira5 = NSRegularExpression(pattern: "[な-のナ-ノ]", options: NSRegularExpressionOptions())
//        static let regex_hira6 = NSRegularExpression(pattern: "[は-ほハ-ホ]", options: NSRegularExpressionOptions())
//        static let regex_hira7 = NSRegularExpression(pattern: "[ま-もマ-モ]", options: NSRegularExpressionOptions())
//        static let regex_hira8 = NSRegularExpression(pattern: "[や-よヤ-ヨ]", options: NSRegularExpressionOptions())
//        static let regex_hira9 = NSRegularExpression(pattern: "[ら-ろラ-ロ]", options: NSRegularExpressionOptions())
//        static let regex_hira10 = NSRegularExpression(pattern: "[わ-んワ-ン]", options: NSRegularExpressionOptions())
//        static let regex_yomigana = NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())
//        var regex_azAZ = NSRegularExpression();
//        var regex_hira1 = NSRegularExpression();
//        var regex_hira2 = NSRegularExpression();
//        var regex_hira3 = NSRegularExpression();
//        var regex_hira4 = NSRegularExpression();
//        var regex_hira5 = NSRegularExpression();
//        var regex_hira6 = NSRegularExpression();
//        var regex_hira7 = NSRegularExpression();
//        var regex_hira8 = NSRegularExpression();
//        var regex_hira9 = NSRegularExpression();
//        var regex_hira10 = NSRegularExpression();
//        var regex_yomigana = NSRegularExpression();
        
//        do{
//            try regex_azAZ = NSRegularExpression(pattern: "[a-zA-Z]", options: NSRegularExpressionOptions())
//        }
//        catch{
//        }
        
        do{
//            let regex_azAZ = try NSRegularExpression(pattern: "[a-zA-Z]", options: NSRegularExpressionOptions())
            let regex_hira1 = try NSRegularExpression(pattern: "[あ-おア-オ]", options: NSRegularExpressionOptions())
            let regex_hira2 = try NSRegularExpression(pattern: "[か-こカ-コ]", options: NSRegularExpressionOptions())
            let regex_hira3 = try NSRegularExpression(pattern: "[さ-そサ-ソ]", options: NSRegularExpressionOptions())
            let regex_hira4 = try NSRegularExpression(pattern: "[た-とタ-ト]", options: NSRegularExpressionOptions())
            let regex_hira5 = try NSRegularExpression(pattern: "[な-のナ-ノ]", options: NSRegularExpressionOptions())
            let regex_hira6 = try NSRegularExpression(pattern: "[は-ほハ-ホ]", options: NSRegularExpressionOptions())
            let regex_hira7 = try NSRegularExpression(pattern: "[ま-もマ-モ]", options: NSRegularExpressionOptions())
            let regex_hira8 = try NSRegularExpression(pattern: "[や-よヤ-ヨ]", options: NSRegularExpressionOptions())
            let regex_hira9 = try NSRegularExpression(pattern: "[ら-ろラ-ロ]", options: NSRegularExpressionOptions())
            let regex_hira10 = try NSRegularExpression(pattern: "[わ-んワ-ン]", options: NSRegularExpressionOptions())
//            let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())

        
            if(str == "a"){
                return item_a
            }
            else if(str == "b"){
                return item_b
            }
            else if(str == "c"){
                return item_c
            }
            else if(str == "d"){
                return item_d
            }
            else if(str == "e"){
                return item_e
            }
            else if(str == "f"){
                return item_f
            }
            else if(str == "g"){
                return item_g
            }
            else if(str == "h"){
                return item_h
            }
            else if(str == "i"){
                return item_i
            }
            else if(str == "j"){
                return item_j
            }
            else if(str == "k"){
                return item_k
            }
            else if(str == "l"){
                return item_l
            }
            else if(str == "m"){
                return item_m
            }
            else if(str == "n"){
                return item_n
            }
            else if(str == "o"){
                return item_o
            }
            else if(str == "p"){
                return item_p
            }
            else if(str == "q"){
                return item_q
            }
            else if(str == "r"){
                return item_r
            }
            else if(str == "s"){
                return item_s
            }
            else if(str == "t"){
                return item_t
            }
            else if(str == "u"){
                return item_u
            }
            else if(str == "v"){
                return item_v
            }
            else if(str == "w"){
                return item_w
            }
            else if(str == "x"){
                return item_x
            }
            else if(str == "y"){
                return item_y
            }
            else if(str == "z"){
                return item_z
            }
            else if(str == "A"){
                return item_a
            }
            else if(str == "B"){
                return item_b
            }
            else if(str == "C"){
                return item_c
            }
            else if(str == "D"){
                return item_d
            }
            else if(str == "E"){
                return item_e
            }
            else if(str == "F"){
                return item_f
            }
            else if(str == "G"){
                return item_g
            }
            else if(str == "H"){
                return item_h
            }
            else if(str == "I"){
                return item_i
            }
            else if(str == "J"){
                return item_j
            }
            else if(str == "K"){
                return item_k
            }
            else if(str == "L"){
                return item_l
            }
            else if(str == "M"){
                return item_m
            }
            else if(str == "N"){
                return item_n
            }
            else if(str == "O"){
                return item_o
            }
            else if(str == "P"){
                return item_p
            }
            else if(str == "Q"){
                return item_q
            }
            else if(str == "R"){
                return item_r
            }
            else if(str == "S"){
                return item_s
            }
            else if(str == "T"){
                return item_t
            }
            else if(str == "U"){
                return item_u
            }
            else if(str == "V"){
                return item_v
            }
            else if(str == "W"){
                return item_w
            }
            else if(str == "X"){
                return item_x
            }
            else if(str == "Y"){
                return item_y
            }
            else if(str == "Z"){
                return item_z
            }
            else if let _ = regex_hira1.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_あ
            }
            else if let _ = regex_hira2.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_か
            }
            else if let _ = regex_hira3.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_さ
            }
            else if let _ = regex_hira4.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_た
            }
            else if let _ = regex_hira5.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_な
            }
            else if let _ = regex_hira6.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_は
            }
            else if let _ = regex_hira7.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_ま
            }
            else if let _ = regex_hira8.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_や
            }
            else if let _ = regex_hira9.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_ら
            }
            else if let _ = regex_hira10.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                return item_わ
            }
            else{
                return item_other
            }
        }catch{
        }
        return item_other
    }
    
    
    static func addSection(str:NSString){
        var sec = ""
        
        do{
            let regex_azAZ = try NSRegularExpression(pattern: "[a-zA-Z]", options: NSRegularExpressionOptions())
            let regex_hira1 = try NSRegularExpression(pattern: "[あ-おア-オ]", options: NSRegularExpressionOptions())
            let regex_hira2 = try NSRegularExpression(pattern: "[か-こカ-コ]", options: NSRegularExpressionOptions())
            let regex_hira3 = try NSRegularExpression(pattern: "[さ-そサ-ソ]", options: NSRegularExpressionOptions())
            let regex_hira4 = try NSRegularExpression(pattern: "[た-とタ-ト]", options: NSRegularExpressionOptions())
            let regex_hira5 = try NSRegularExpression(pattern: "[な-のナ-ノ]", options: NSRegularExpressionOptions())
            let regex_hira6 = try NSRegularExpression(pattern: "[は-ほハ-ホ]", options: NSRegularExpressionOptions())
            let regex_hira7 = try NSRegularExpression(pattern: "[ま-もマ-モ]", options: NSRegularExpressionOptions())
            let regex_hira8 = try NSRegularExpression(pattern: "[や-よヤ-ヨ]", options: NSRegularExpressionOptions())
            let regex_hira9 = try NSRegularExpression(pattern: "[ら-ろラ-ロ]", options: NSRegularExpressionOptions())
            let regex_hira10 = try NSRegularExpression(pattern: "[わ-んワ-ン]", options: NSRegularExpressionOptions())
//                        let regex_yomigana = try NSRegularExpression(pattern: "^[a-zA-Zあ-ん]*$", options: NSRegularExpressionOptions())
        
        
            if let _ = regex_azAZ.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = str.lowercaseString
            }
            else if let _ = regex_hira1.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
            sec = "あ"
            }
            else if let _ = regex_hira2.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "か"
            }
            else if let _ = regex_hira3.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "さ"
            }
            else if let _ = regex_hira4.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "た"
            }
            else if let _ = regex_hira5.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "な"
            }
            else if let _ = regex_hira6.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "は"
            }
            else if let _ = regex_hira7.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "ま"
            }
            else if let _ = regex_hira8.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "や"
            }
            else if let _ = regex_hira9.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "ら"
            }
            else if let _ = regex_hira10.firstMatchInString(str as String, options: NSMatchingOptions(), range: NSMakeRange(0, str.length)){
                sec = "わ"
            }
            else{
                sec = "other"
            }
            if(sec != ""){
                var flg = true
                for elem in mySections{
                    if(elem as! String == sec){
                        flg = false
                        break
                    }
                }
                if(flg){
                    mySections.addObject(sec)
                }
            }
        }catch{
        }
    }
    
    ///正規表現にマッチする要素でGlobalData.arrayを作り直す
    static func refreshList(text :String = "",matchValid: Bool = true,all:Bool = false,perfectMatch: Bool = true){
        
        GlobalData.array = getNewList(text, matchValid:matchValid,all:all,perfectMatch:perfectMatch)
    }
    
    //正規表現にマッチする要素でarrayを取得する
    static func getNewList(text :String = "",matchValid: Bool = true,all:Bool = false,perfectMatch: Bool = true) -> NSMutableArray{
        
        //
        //正規表現の作成
        //
        var regexStr = ""
        if(all){
            regexStr = "."
        }
        else if(perfectMatch){
            regexStr = "^\(text)$"//完全一致
        }
        else{
            regexStr = text//部分一致
        }
        
        
        var regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression(pattern: regexStr, options: NSRegularExpressionOptions())
        } catch _ {
            regex = nil
        }
        
        //
        //正規表現に合ったものを抽出する
        //
        
        let newList: NSMutableArray = []
        //ファイルからデータを読み込む
        let array = NSKeyedUnarchiver.unarchiveObjectWithFile(GlobalData.filePath) as! NSArray
        
        
        for elem in array{
            
            var json:JSON = JSON(rawValue:elem)!
            let str = json["nameKana"].string
            
            let nsSentence: NSString = str!
            
            //正規表現に一致した場合
            if let _ = regex?.firstMatchInString(
                nsSentence as String,
                options: NSMatchingOptions(),
                range: NSMakeRange(0, nsSentence.length)
                ){
                if(matchValid){
                    newList.addObject(elem)
                }
            }
                
            //正規表現に一致しなかった場合
            else if(!matchValid){
                newList.addObject(elem)
            }
        }
        return newList
        
    }
    
    ///GlobalData.arrayからセクションごとのリストを作り直す
    static func refreshAllList(){
        
        //セクションごとのリストを全て空に
        GlobalData.removeAllArray()
        //セクションのリストを空に
        GlobalData.mySections.removeAllObjects()
        
        
        for elem in GlobalData.array{
            var json:JSON = JSON(rawValue:elem)!
            var str = json["nameKana"].string
            GlobalData.getRefferenceList(str!.substringToIndex(advance(str!.startIndex, 1))).addObject(elem)
            GlobalData.addSection(str!.substringToIndex(advance(str!.startIndex, 1)))
        }
        
        //----------------
        //セクションの並び替え
        //----------------
        
        //並び替え用の配列
        var arr = [String]()
        for elem in GlobalData.mySections{
            arr.append(elem as! String)
        }
        //配列のソート
        print("////////////")
        print(arr)
        arr.sortInPlace {$0 < $1}
        print(arr)
        print("////////////")
        
        //セクションのリストを空に
        GlobalData.mySections.removeAllObjects()
        
        for elem in arr{
            GlobalData.mySections.addObject(elem)
        }
        
    }
}
