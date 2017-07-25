//
//  CustomSwiftObject.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/18.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

//单例

import UIKit

class CustomSwiftObject: NSObject {
    var name : NSString!
    
    static let sharedInstance = CustomSwiftObject()//最简单单例写法
    fileprivate override init() {}
}
