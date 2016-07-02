//
//  PiecemealStore.swift
//  CodingSupport
//
//  Created by Zero on 16/7/2.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

public class PieceStore: NSObject {
    
    private static let defaultUserName = "default"
    
    public class func saveUserId(userId: String) {
        NSUserDefaults.standardUserDefaults().setObject(userId, forKey: "user_id")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func userId() -> String {
        if let userDefaultName = NSUserDefaults.standardUserDefaults().stringForKey("user_id") {
            return userDefaultName
        }
        return defaultUserName
    }
    
    class func saveInfo(obj: NSObject) {
        let infoData = NSKeyedArchiver.archivedDataWithRootObject(obj)
        NSUserDefaults.standardUserDefaults().setObject(infoData, forKey: String(format: "user_id_%@_type_%@", PieceStore.userId(), String(obj.dynamicType)))
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    class func getInfo<T: NSObject>(type: T.Type) -> T {
        let infoData = NSUserDefaults.standardUserDefaults().objectForKey(String(format: "user_id_%@_type_%@", userId(), String(type))) as? NSData
        if let _infoData = infoData {
            let userInfo = NSKeyedUnarchiver.unarchiveObjectWithData(_infoData) as! T
            return userInfo
        }
        return T()
    }
    
    public class func update(modelType: NSObject.Type, value:AnyObject, key: String) {
        let info = getInfo(modelType)
        info.setValue(value, forKey: key)
        saveInfo(info)
    }
    
    public class func get(modelType: NSObject.Type, key: String) -> AnyObject? {
        if let value = getInfo(modelType).valueForKey(key) {
            return value
        }
        return nil
    }
}
