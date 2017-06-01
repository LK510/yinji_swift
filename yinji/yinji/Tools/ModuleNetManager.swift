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
        
        var param:NSMutableDictionary = NSMutableDictionary{ () -> NSMutableDictionary in
            
            let param:NSMutableDictionary = NSMutableDictionary()
            
            param.setValue(userInfo.userName, forKey: "username")
            param.setValue(userInfo.userPwd, forKey: "password")
            param.setValue(self.getUUID, forKey: "deviceid")
            param.setValue(self.currentTimeStampStr, forKey: "time")
            param.setValue(self.getBundleName, forKey: "pn")
            param.setValue("all", forKey: "act")
            param.setValue("login", forKey: "method")
            
            return param
            
        }
                
        TabHttpTool.request(method: RequsetMethod.POST, urlString: "https://api.anybeen.com/index.php", parameters: param as AnyObject) { (response, error) in
            
            
//            let resDic = try?JSONSerialization.jsonObject(with: response, options: [])
            
            
            print(response as Any)
  
            
        }
        
        return true
        
    }

}
