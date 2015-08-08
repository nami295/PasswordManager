//
//  common.swift
//  archiveText
//
//  Created by R.Kurachi on 2015/05/24.
//  Copyright (c) 2015年 R.Kurachi. All rights reserved.
//

import Foundation

struct GlobalData{
    
    
    // Sectionで使用する配列を定義する.
    static var mySections: NSMutableArray = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
        "あ","か","さ","た","な","は","ま","や","ら","わ","other"]
    
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
    
    
    static let prefix = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
        "あ","か","さ","た","な","は","ま","や","ら","わ"]
    
    
    
    static func getRefferenceList(num:Int) -> NSMutableArray{
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
    
    
    static func getRefferenceList(str:String) -> NSMutableArray{
        switch(str){
        case "a":
            return item_a
        case "b":
            return item_b
        case "c":
            return item_c
        case "d":
            return item_d
        case "e":
            return item_e
        case "f":
            return item_f
        case "g":
            return item_g
        case "h":
            return item_h
        case "i":
            return item_i
        case "j":
            return item_j
        case "k":
            return item_k
        case "l":
            return item_l
        case "m":
            return item_m
        case "n":
            return item_n
        case "o":
            return item_o
        case "p":
            return item_p
        case "q":
            return item_q
        case "r":
            return item_r
        case "s":
            return item_s
        case "t":
            return item_t
        case "u":
            return item_u
        case "v":
            return item_v
        case "w":
            return item_w
        case "x":
            return item_x
        case "y":
            return item_y
        case "x":
            return item_z
        case "あ":
            return item_あ
        case "か":
            return item_か
        case "さ":
            return item_さ
        case "た":
            return item_た
        case "な":
            return item_な
        case "は":
            return item_は
        case "ま":
            return item_ま
        case "や":
            return item_や
        case "ら":
            return item_ら
        case "わ":
            return item_わ
        default:
            return item_other
        }
    }
    
}