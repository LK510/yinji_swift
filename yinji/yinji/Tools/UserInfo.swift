//
//  UserInfo.swift
//  yinji
//
//  Created by 路飞 on 2017/5/23.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation

class UserInfo: NSObject {
    
    var phoneNum: String?
    var userPwd: String?
    var secKey: String?
    var userPwdNew: String?
    var email: String?
    var userName: String?
    
    var nickName: String?
    var intro: String?
    var icon: String?

    
    //KVC
    init(dict: [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    //过滤
    override func setValue(_ value: Any?, forUndefinedKey key: String) {     }
    
}
