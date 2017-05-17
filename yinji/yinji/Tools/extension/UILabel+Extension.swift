//
//  UILabel+Extension.swift
//  weibo
//
//  Created by 叶凤鸣 on 16/5/25.
//  Copyright © 2016年 yezi. All rights reserved.
//

import UIKit

extension UILabel {
    //给UILabel 添加一个便利的构造函数
    convenience init(title: String, font: CGFloat, textColor: UIColor, alignment: NSTextAlignment = .center) {
        
        //调用指定的构造函数 实例化对象
        self.init(frame: CGRect.init(origin: .init(x: 50, y: 50), size: .init(width: 100, height: 100)))
        self.text = title
        self.font = UIFont.systemFont(ofSize: font)
        self.textColor = textColor
        
        textAlignment = alignment
        
        //设置自动换行
//        if alignment == .left {
//            //设置最大布局宽度
//            preferredMaxLayoutWidth = ScreenWidth - 2 * StatusCellMargin
//        }
        
        //设置自动换行
        numberOfLines = 0
        //自适应大小
        sizeToFit()
    }
}
