//
//  GSExtensionsViewController.swift
//  GSSwiftKitDemo
//
//  Created by Mars Gao on 2016/12/21.
//  Copyright © 2016年 Mars Gao. All rights reserved.
//

/*
 添加计算型属性和计算静态属性
 定义实例方法和类型方法
 提供新的构造器w   1s1
 定义下标
 定义和使用新的嵌套类型
 使一个已有类型符合某个协议
 */

import UIKit

class GSExtensionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Extension";
        self.view.backgroundColor = UIColor.white;
        
        let preson = GSPreson.init(age_: 123, name_: "test");
        preson.sayHello();
        preson.gogo();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
