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

        //Mark: `save student's info`
        
        PieceStore.update(Student.self, value: 23, key: "age")
        PieceStore.update(Student.self, value: "LiDan", key: "name")
        
        //Mark: `save teacher's info`
        PieceStore.update(Teacher.self, value: 48, key: "age")
        PieceStore.update(Teacher.self, value: "English", key: "course")
        
        //Mark: `get student's info`
        let studentName = PieceStore.get(Student.self, key: "name")
        let teachaerCourse = PieceStore.get(Teacher.self, key: "course")
        
        print("student name is : " + (studentName! as! String))
        print("teacher's course is : " +  ((teachaerCourse!) as! String))
        //Mark: `get teacher's info`
        //...
    }
}

