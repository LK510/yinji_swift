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
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = randomColor()
        
        self.view.addSubview(nameLabel)
        
    }

    lazy var baseVc:BaseTableViewVc = BaseTableViewVc()

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        present(baseVc, animated: true) { 
            
            print("------")
        }
        
        
        let TabHttpTool = NetworkManager()
        //创建请求参数
        let params = ["username":"invest","password":"123456"]
        //发送psot请求
        
        TabHttpTool.request(requestType: HTTPRequestType.POST, urlString: "http://api....../login", parameters: params as [String : AnyObject]) { (response) in
            
            
            
        }
        
   
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

