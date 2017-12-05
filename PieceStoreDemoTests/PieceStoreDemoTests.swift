//
//  PieceStoreDemoTests.swift
//  PieceStoreDemoTests
//
//  Created by 李锋 on 2017/12/5.
//  Copyright © 2017年 Zero. All rights reserved.
//

import XCTest
@testable import PieceStoreDemo

// @availiable Swift4
class User: Codable {
    var name = "default name"
    var gender = true
}

class PieceStoreDemoTests: XCTestCase {
    
    let user1 = User()
    let user1ContextId = "user1 context id"
    
    let user2 = User()
    let user2ContextId = "user2 context id"
    
    override func setUp() {
        super.setUp()
        user1.gender = false
        user1.name = "user1.name"
        
        user2.gender = true
        user2.name = "user2.name"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSaveAUser() {
        PieceStore.handleContext(userId: user1ContextId)
        PieceStore.save(obj: user1)
    }
    
    func testExchangeContext() {
        PieceStore.handleContext(userId: user2ContextId)
        PieceStore.save(obj: user2)
    }
    
    func testGetUser() {
        PieceStore.handleContext(userId: user1ContextId)
        let _user1 = PieceStore.get(type: User.self)
        XCTAssertEqual(_user1?.gender, user1.gender, "user's gender not equal")
        XCTAssertEqual(_user1?.name, user1.name, "user' name not equal")
    }
    
    func testGetNewContextUser() {
        PieceStore.handleContext(userId: user2ContextId)
        let _user2 = PieceStore.get(type: User.self)
        XCTAssertEqual(_user2?.gender, user2.gender, "user's gender not equal")
        XCTAssertEqual(_user2?.name, user2.name, "user' name not equal")
    }
}


