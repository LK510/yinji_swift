//
//  UIButton+Extension.swift
//  yinji
//
//  Created by 路飞 on 2017/5/17.
//  Copyright © 2017年 路飞. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(title: String, font: CGFloat, textColor: UIColor, backgroundColor: UIColor,alignment: NSTextAlignment,image: UIImage?,backImage:UIImage?, frame: CGRect) {
        
        
        self.init(frame: frame)
        setTitle(title, for: UIControlState())
        setImage(image, for: UIControlState())
        setTitleColor(textColor, for: UIControlState())
        setBackgroundImage(backImage, for: UIControlState())
        
        titleLabel?.font = UIFont.systemFont(ofSize: font)
        titleLabel?.textAlignment = alignment
        
        titleLabel?.numberOfLines = 0;
        sizeToFit()

    }
    
    
}
