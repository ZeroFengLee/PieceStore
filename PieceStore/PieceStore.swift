//
//  PiecemealStore.swift
//  CodingSupport
//
//  Created by Zero on 16/7/2.
//  Copyright © 2016年 Zero. All rights reserved.
//

import Foundation

public class PieceStore: NSObject {
    
    private static let defaultUserName = "default"
    
    public class func handleContext(userId: String) {
        UserDefaults.standard.set(userId, forKey: "user_id")
        UserDefaults.standard.synchronize()
    }
    
    public class func userId() -> String {
        if let userDefaultName = UserDefaults.standard.string(forKey: "user_id") {
            return userDefaultName
        }
        return defaultUserName
    }
    
    public class func saveInfo(obj: NSObject) {
        let infoData = NSKeyedArchiver.archivedData(withRootObject: obj)
        UserDefaults.standard.set(infoData, forKey: String(format: "user_id_%@_type_%@", PieceStore.userId(), String(describing: type(of: obj))))
        UserDefaults.standard.synchronize()
    }
    
    public class func getInfo<T: NSObject>(type: T.Type) -> T {
        let infoData = UserDefaults.standard.object(forKey: String(format: "user_id_%@_type_%@", userId(), String(describing: type))) as? NSData
        if let _infoData = infoData {
            let userInfo = NSKeyedUnarchiver.unarchiveObject(with: _infoData as Data) as! T
            return userInfo
        }
        return type.init()
    }
    
    public class func update(modelType: NSObject.Type, value:AnyObject, key: String) {
        let info = getInfo(type: modelType)
        info.setValue(value, forKey: key)
        saveInfo(obj: info)
    }
    
    public class func get(modelType: NSObject.Type, key: String) -> AnyObject? {
        if let value = getInfo(type: modelType).value(forKey: key) {
            return value as AnyObject?
        }
        return nil
    }
}
