//
//  BaseTableViewVc.swift
//  yinji
//
//  Created by 路飞 on 2017/5/17.
//  Copyright © 2017年 路飞. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class BaseTableViewVc: UIViewController {
    
//    lazy var baseTableView: UITableView = {
//       
//        let baseTableView = UITableView()
//        
//        baseTableView.snp.makeConstraints({ (make) ->Void in
//            make.width.height.equalTo(100)
//            make.center.equalTo(self.view)
//        })
//        
//        
//        baseTableView.delegate = self as? UITableViewDelegate
//        baseTableView.dataSource = self as? UITableViewDataSource
//        
//        return baseTableView
//        
//    }()
    
    fileprivate lazy var baseTableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(baseTableView)
        
        baseTableView.backgroundColor = UIColor.gray
        
        baseTableView.snp.makeConstraints { (make) ->Void in
            
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
