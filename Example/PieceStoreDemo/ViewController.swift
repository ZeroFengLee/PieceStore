//
//  ViewController.swift
//  PieceStoreDemo
//
//  Created by Zero on 16/7/3.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit
import PieceStore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //分用户存储
        saveUserId("U001")
        
        updateUserInfoName("Zero")
        let sName = getUserInfoName()
        print(sName)
    }
}

