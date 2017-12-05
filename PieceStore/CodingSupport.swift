//
//  CodingSupport.swift
//  CodingSupport
//
//  Created by Zero on 16/7/2.
//  Copyright © 2016年 Zero. All rights reserved.
//

import Foundation

open class CodingSupport: NSObject, NSCoding {
    
    public func encode(with aCoder: NSCoder) {
        var count: UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        for i in 0..<Int(count) {
            let ivar = ivars?[i]
            let key = NSString(cString: ivar_getName(ivar!)!, encoding: String.Encoding.utf8.rawValue)! as String
            let value = self.value(forKey: key)
            aCoder.encode(value, forKey: key)
        }
        free(ivars)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init()
        var count: UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        for i in 0..<Int(count) {
            let ivar = ivars?[i]
            let key = NSString(cString: ivar_getName(ivar!)!, encoding: String.Encoding.utf8.rawValue)! as String
            let value = aDecoder.decodeObject(forKey: key)
            self.setValue(value, forKey: key)
        }
        free(ivars)
    }
    
    public override init() {
        super.init()
    }
}
