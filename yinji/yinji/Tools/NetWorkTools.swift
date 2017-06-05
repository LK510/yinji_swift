//
//  NetWorkTools.swift
//  yinji
//
//  Created by 路飞 on 2017/5/17.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation
import AFNetworking

//枚举定义请求方式
enum RequsetMethod:String {
    case GET = "GET"
    case POST =  "POST"
}

class NetworkManager: AFHTTPSessionManager {
    
    //单例
//    static let shared = NetworkManager()
    
    static let shareTools:NetworkManager = {
      
        let instance = NetworkManager()
        instance.responseSerializer.acceptableContentTypes?.insert("text/html")
//        instance.responseSerializer.acceptableContentTypes?.insert("text/plain")
        return instance
        
    }()
    
    typealias httptoolBack = (_ response:AnyObject?,_ error:NSError?)->()
    
    /// 封装GET和POST 请求
    ///
    /// - Parameters:
    ///   - requestType: 请求方式
    ///   - urlString: urlString
    ///   - parameters: 字典参数
    ///   - completion: 回调
    func request(Method:RequsetMethod = .GET, URLString: String,parameters: [String: AnyObject]?, completed:@escaping ((_ json: AnyObject?, _ isSuccess: Bool)->())) {
        
        /// 定义成功回调闭包
        let success = { (task: URLSessionDataTask,json: Any?)->() in
            completed(json as AnyObject?,true)
        }
        
        /// 定义失败回调闭包
        let failure = {(task: URLSessionDataTask?, error: Error)->() in
            completed(nil,false)
        }
        
        /// 通过请求方法,执行不同的请求
        // 如果是 GET 请求
        if Method == .GET { // GET
            
            get(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
            
        } else { // POST
            
            post(URLString, parameters: parameters, progress: nil, success: success, failure: failure)
        }
    }

    
    /// 发送请求(上传文件)
    
    func requestWithData(data: NSData, name: String, urlString: String, parameters: AnyObject?, finished:@escaping httptoolBack) {
        // 定义请求成功的闭包
        let success = { (dataTask: URLSessionDataTask, responseObject: AnyObject?) -> Void in
            finished(responseObject, nil)
        }
        
        // 定义请求失败的闭包
        let failure = { (dataTask: URLSessionDataTask?, error: NSError) -> Void in
            finished(nil, error)
        }
        
        post(urlString, parameters: parameters, constructingBodyWith: { (formData) -> Void in
            formData.appendPart(withFileData: data as Data, name: name, fileName: "aa", mimeType: "application/octet-stream")
        }, progress: nil, success: success as? (URLSessionDataTask, Any?) -> Void, failure: failure as? (URLSessionDataTask?, Error) -> Void)
    }
}
