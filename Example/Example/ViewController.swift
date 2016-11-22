//
//  ViewController.swift
//  Example
//
//  Created by 李锋 on 2016/11/22.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleContext(id: "U002")
        
        //Model属性单独更新
        updateUserInfoName(name: "lifengxxx")
        let sName = getUserInfoName()
        print(sName)
        
        
        //整个Model更新
        let userInfo = UserInfo.userInfoMaker(name: "XXYY", gender: true)
        updateModelObj(obj: userInfo)
        let obj = getModelObj(type: UserInfo.self)
        print(obj.username)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

