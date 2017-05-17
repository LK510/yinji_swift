//
//  UIBarButtonItem+extension.swift
//  weibo
//
//  Created by 叶凤鸣 on 16/5/21.
//  Copyright © 2016年 yezi. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

    convenience init(imageName: String? = nil,title: String? = nil,target: AnyObject?, action: Selector) {
        
        self.init()
        let btn = UIButton()
        
        if let img = imageName {
            btn.setImage(UIImage(named: img), for: UIControlState())
            btn.setImage(UIImage(named: img + "_highlighted"), for: .highlighted)
        }
        
        // 设置title
        btn.setTitle(title, for: UIControlState())
        // 设置颜色
        btn.setTitleColor(UIColor.darkGray, for: UIControlState())
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        
        btn.addTarget(target, action: action, for: .touchUpInside)
        // 设置自适应大小
        btn.sizeToFit()
        
        // 设置自定义视图
        self.customView = btn
    }
}
