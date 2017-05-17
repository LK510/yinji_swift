//
//  UIImage+Extension.swift
//  weibo
//
//  Created by 叶凤鸣 on 16/5/28.
//  Copyright © 2016年 yezi. All rights reserved.
//

import UIKit

extension UIImage {
    //截取当前屏幕
    class func snapShotCurrentWindow() -> UIImage {
        
        let window = UIApplication.shared.keyWindow!
        //开启图片上下文
        UIGraphicsBeginImageContextWithOptions(window.bounds.size, false, 0)
        //需要将window中显示的内容画到图片上下文中
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: false)
        
        //从图形上下文中获取图片
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //关闭图片上下文
        UIGraphicsEndImageContext()
        
        return image!
    }
}
