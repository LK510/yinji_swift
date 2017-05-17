//
//  UIView_Inspectable.swift
//  weibo
//
//  Created by 叶凤鸣 on 16/5/21.
//  Copyright © 2016年 yezi. All rights reserved.
//

import UIKit

extension UIView {
    
    //能够添加属性 最主要是因为没有使用到成员变量
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            
            layer.masksToBounds = newValue > 0
        }
    }
    
    //边线可视化属性
    @IBInspectable var borderWidth: CGFloat {
        get {
         return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    // 颜色
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}
