//
//  FMNetworkTools.swift
//  01-Swift网络框架封装
//
//  Created by yefengming on 16/5/22.
//  Copyright © 2016年 yefengming. All rights reserved.
//

import UIKit
//导入命名空间
import AFNetworking

// 结构体
struct API {
    // 加static可以直接用点语法
    // 线上环境
    static let hostName = "https://api.weibo.com/"
    // 测试环境(OC中宏定义)
    //    static let hostName = "https://dev.api.weibo.com/"
    //加载用户token
    static let loadAccessToken = "oauth2/access_token"
    //加载用户信息
    static let loadUserInfo = "2/users/show.json"
    
    // 加载首页数据
    // 微博接口 -> statuses/home_timeline->https://api.weibo.com/2/statuses/home_timeline.json
    static let loadHomedata = "2/statuses/home_timeline.json"
    
    /// 发布微博
    static let sendStatus = "2/statuses/update.json"
    
    // 发布图片微博
    static let sendImageStatus = "https://upload.api.weibo.com/2/statuses/upload.json"
}

//声明枚举
//枚举任意类型
enum HTTPMethods: Int {
    case POST
    case GET
}

class FMNetworkTools: AFHTTPSessionManager {
    //声明单例对象
    static let sharedTools: FMNetworkTools = {
        //把url前面一样的部分 声明为基础的url地址
        let url = NSURL(string: "http://123.57.39.181/fyq/answer/web/index.php?r=site/index")
//        let url = NSURL(string: API.hostName)
        let tools = FMNetworkTools(baseURL: url! as URL)
        
        tools.responseSerializer.acceptableContentTypes?.insert("text/plain")
        
        return tools
    }()
    
    //封装 get & post 请求方法
    func request(method: HTTPMethods,urlString: String, parameters: AnyObject?,finished: @escaping (_ responseObject: AnyObject?, _ error: NSError?) -> () ) {
        
        //定义闭包参数 将相同的闭包当做参数传递
        let success = { (task: URLSessionDataTask, result: AnyObject?) -> () in
            //执行请求成功的回调
            finished(result, nil)
        }
        
        let failure = { (task: URLSessionDataTask?, error: NSError) -> () in
            print(error)
            //执行失败的回调
            finished(nil, error)
        }
        
        if method == .GET {
            
            get(urlString, parameters: parameters, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)

        } else {
            
            post(urlString, parameters: parameters, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)

        }
    }    
}

