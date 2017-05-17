//
//  common.swift
//  weibo
//
//  Created by 叶凤鸣 on 16/5/20.
//  Copyright © 2016年 yezi. All rights reserved.
//

import UIKit


let ScreenWidth = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height

//定义通知的名称
let SwitchRootViewController = "SwitchRootViewController"

let AppErrorTip = "网络君正在睡觉,请稍后再试"

//沙盒路径
let homeDirectory = NSHomeDirectory()
let ducumentPath = NSHomeDirectory() + "/Documents"
let libraryPath = NSHomeDirectory() + "/Library"
let cachePath2 = NSHomeDirectory() + "/Library/Caches"
let tmpDir = NSTemporaryDirectory()

let bundlePath = Bundle.main

// 随机色
func randomColor() -> UIColor {
    
    let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
    let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
}

// 日期对象
let sharedDF = DateFormatter()
