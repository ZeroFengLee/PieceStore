//
//  UserInfo.swift
//  Example
//
//  Created by 李锋 on 2016/11/22.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

class UserInfo: CodingSupport {
    var username: String = "default" //用户名
    var gender: Bool = true //用户性别
    
    class func userInfoMaker(name: String, gender: Bool) -> UserInfo {
        let userInfo = UserInfo()
        userInfo.username = name
        userInfo.gender = gender
        return userInfo
    }
}
