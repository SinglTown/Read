//
//  Anye.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/7/19.
//  Copyright © 2017年 赵传保. All rights reserved.
//


import Foundation
import UIKit

let windWidth = UIScreen.main.bounds.width
let windHeight =  UIScreen.main.bounds.height

let APP_DELEGATE = UIApplication.shared.delegate
let isIPhoneX = UIApplication.shared.statusBarFrame.size.height > 20

let kGetStatusBarHeight = isIPhoneX ? 44 : 20

let kIPhoneXBottomSpace = isIPhoneX ? (83-49) : 0

let kTabBarHeight = isIPhoneX ? 83 : 49

let kNavBarHeight = 44

let kTopHeight = kGetStatusBarHeight + kNavBarHeight

func SETMyFontWith(_ fontSize:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: fontSize)
}

//计算token的secret
let secret = "huiwenanye"

//参数
let device_id = MyUUIDManager.getUUID()
let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
//图片
func myImageNamed(_ imageStr:String) -> UIImage {
    let endImage = UIImage(named: imageStr)
    if endImage != nil {
        return endImage!
    }else{
        return UIImage()
    }
}

func kRGBColorFromHex(_ rgbValue:Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0, alpha: 1.0)
}
//获取时间
func getNowTimeOfSystem() -> String {
    let date = NSDate()
    let time = date.timeIntervalSince1970
    let intTime = Int(time)
    
    return String(intTime)
}

public let kMainTopBackColor = kRGBColorFromHex(0x222326)

let kMainColor = kRGBColorFromHex(0xD14100)

let MainBackGroundColor = kRGBColorFromHex(0xefeff4)

//T表示不指定日志信息参数类型
func printLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    #if DEBUG
        let lastFileName = (fileName as NSString).lastPathComponent
        //        print("方法:\(methodName)  行号:\(lineNumber)  打印信息:\(message)");
        print("类名:\(lastFileName as NSString) 第\(lineNumber)行 方法名:\(methodName) 打印信息:\(message)");
    #endif
}
