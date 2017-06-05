//
//  ModuleNetManager.swift
//  yinji
//
//  Created by 路飞 on 2017/5/25.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation

class ModuleNetManager: NSObject {
    
    private lazy var TabHttpTool:NetworkManager = NetworkManager()
    
    public func userLogin(userInfo:UserInfo) -> Bool {
        
//        let param:NSMutableDictionary = NSMutableDictionary{ () -> NSMutableDictionary in
//            
//            let param:NSMutableDictionary = NSMutableDictionary()
//            
//            param.setValue(userInfo.userName, forKey: "username")
//            param.setValue(userInfo.userPwd, forKey: "password")
//            param.setValue(self.getUUID, forKey: "deviceid")
//            param.setValue(self.currentTimeStampStr, forKey: "time")
//            param.setValue(self.getBundleName, forKey: "pn")
//            param.setValue("all", forKey: "act")
//            param.setValue("login", forKey: "method")
//            
//            return param
//            
//        }
        
        let systemManager:SystemUtils = SystemUtils()

        let userPwd:String = systemManager.md5String(str: "111111")
        
        let param = ["username":"text13","password":userPwd,"deviceid":self.getUUID,"time":self.currentTimeStampStr,"pn":self.getBundleName,"act":"all","method":"login"]
            
        
        return true
        
    }

}
