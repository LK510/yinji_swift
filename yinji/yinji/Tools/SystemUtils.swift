//
//  SystemUtils.swift
//  yinji
//
//  Created by 路飞 on 2017/5/25.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation

class SystemUtils: NSObject {
    
    
    func md5String(str:String) -> String{
        let cStr = str.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    
    
}
