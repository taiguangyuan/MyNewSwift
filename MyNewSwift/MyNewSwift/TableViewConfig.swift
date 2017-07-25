//
//  TableViewConfig.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/12.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

import UIKit

class TableViewConfig: NSObject {

    var name = ""
    var imageName = ""
    var selector = ""
    
    
    func configObj(_ name : String, imageName : String, selector : String) -> TableViewConfig {
        self.name = name
        self.imageName = imageName
        self.selector = selector
        
        return self
    }
}
