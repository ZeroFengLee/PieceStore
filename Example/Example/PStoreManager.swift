//
//  PStoreManager.swift
//  Example
//
//  Created by 李锋 on 2016/11/22.
//  Copyright © 2016年 Zero. All rights reserved.
//

import Foundation

//MARK: 切换用户
func handleContext(id: String) {
    PieceStore.handleContext(userId: id)
}

//MARK: 更新操作
func updateUserInfoName(name: String) {
    PieceStore.update(modelType: UserInfo.self, value: name as AnyObject, key: "username")
}

func updateUserInfoSex(sex: Bool) {
    PieceStore.update(modelType: UserInfo.self, value: sex as AnyObject, key: "userSex")
}

//MARK: 查询操作
func getUserInfoName() -> String {
    return PieceStore.get(modelType: UserInfo.self, key: "username") as! String
}

//-----------------------------------------

//MARK: 更新整个Model
func updateModelObj(obj: NSObject) {
    PieceStore.saveInfo(obj: obj)
}

//MARK: 查询整个Model
func getModelObj<T: NSObject>(type: T.Type) -> T {
    return PieceStore.getInfo(type: type)
}
