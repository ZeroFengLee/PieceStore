//
//  MyUserDefault.swift
//  PieceStoreDemo
//
//  Created by Zero on 16/7/3.
//  Copyright © 2016年 Zero. All rights reserved.
//

import Foundation
import PieceStore

func saveUserId(id: String) {
    PieceStore.saveUserId(id)
}

//MARK: 更新用户信息
func updateUserInfoName(name: String) {
    PieceStore.update(UserInfo.self, value: name, key: "username")
}

func updateUserInfoSex(sex: Bool) {
    PieceStore.update(UserInfo.self, value: sex, key: "userSex")
}

//MARK: 获取用户信息
func getUserInfoName() -> String {
    return PieceStore.get(UserInfo.self, key: "username") as! String
}

