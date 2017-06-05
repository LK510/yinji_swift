//
//  ViewController.swift
//  yinji
//
//  Created by 路飞 on 2017/5/16.
//  Copyright © 2017年 路飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    lazy var testBtn: UIButton = UIButton.init(title: "test", font: 15, textColor: .red, backgroundColor: randomColor(), alignment: .left, image: UIImage.init(named: "")!, backImage: UIImage.init(named: "")!, frame: CGRect.init(origin: CGPoint.init(x: 50, y: 50), size: CGSize.init(width: 200, height: 200)))
    
    fileprivate lazy var nameLabel: UILabel = UILabel(title: "杜雷", font: 14, textColor: UIColor.darkGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = randomColor()
        
        self.view.addSubview(nameLabel)
        
    }
    
    lazy var baseVc:BaseTableViewVc = BaseTableViewVc()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        present(baseVc, animated: true) { 
//            
//            print("------")
//        }
        
        
        //OC混编
        var testVc:TestViewController = TestViewController()
        
        
        let TabHttpTool = NetworkManager()
        
        //创建请求参数
        let params = ["username":"invest","password":"123456"]
        
        TabHttpTool.request(URLString: "http://123.57.39.181/fyq/answer/web/index.php?r=site/index", parameters: params as [String : AnyObject], completed:{(json: AnyObject?,isSuccess: Bool)-> () in
            
            // 请求成功
            if isSuccess {
                print(json ?? "")
            } else {
                print("请求失败")
            }
        })
        
    }
    
    
    @IBAction func logDidClick(_ sender: Any) {
        
        let systemManager:SystemUtils = SystemUtils()
        let userPwd:String = systemManager.md5String(str: "111111")
        
        let dic = ["userName":"text13","userPwd":userPwd]
        
        let info = UserInfo(dict: dic as [String : AnyObject])
        
        //        info.setValuesForKeys(dic)
        
        
        let netManager:ModuleNetManager = ModuleNetManager()
        
        netManager.userLogin(userInfo: info)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

