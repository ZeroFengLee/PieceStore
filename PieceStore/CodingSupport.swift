//
//  CodingSupport.swift
//  CodingSupport
//
//  Created by Zero on 16/7/2.
//  Copyright © 2016年 Zero. All rights reserved.
//

import UIKit

public class CodingSupport: NSObject, NSCoding {
    public func encodeWithCoder(aCoder: NSCoder) {
        var count: UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        for i in 0..<Int(count) {
            let ivar = ivars[i]
            let key = NSString(CString: ivar_getName(ivar), encoding: NSUTF8StringEncoding) as! String
            let value = self.valueForKey(key)
            aCoder.encodeObject(value, forKey: key)
        }
        free(ivars)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init()
        var count: UInt32 = 0
        let ivars = class_copyIvarList(self.classForCoder, &count)
        for i in 0..<Int(count) {
            let ivar = ivars[i]
            let key = NSString(CString: ivar_getName(ivar), encoding: NSUTF8StringEncoding) as! String
            let value = aDecoder.decodeObjectForKey(key)
            self.setValue(value, forKey: key)
        }
    }
    
    public override init() {
        super.init()
    }
}
