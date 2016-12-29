//
//  GSPreson.swift
//  GSSwiftKitDemo
//
//  Created by Mars Gao on 2016/12/22.
//  Copyright © 2016年 Mars Gao. All rights reserved.
//

import UIKit

class GSPreson: NSObject {
    var age:Int?
    var name:String?
    init(age_:Int) {
        
    }
    init(age_:Int,name_:String) {
        age = age_;
        name = name_;
    }
}
extension GSPreson{
    func sayHello() -> Void {
        print("sayHello -> \(name) + \(age)");
    }
}
