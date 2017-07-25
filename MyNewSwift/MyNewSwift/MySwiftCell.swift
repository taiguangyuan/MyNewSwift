//
//  MySwiftCell.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/12.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

import UIKit

protocol MySwiftCellDelegate {
    func clickedCurrentButton(_ name : String)
}

typealias MySwiftCellBlock = (String) -> Void

class MySwiftCell: UITableViewCell {
    
    @IBOutlet weak var headerImage: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    
    var myCellBlock: MySwiftCellBlock?
    
    var delegate: MySwiftCellDelegate!
    
    var currentObj = TableViewConfig()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setConfigObj(_ configObj : TableViewConfig){
        self.currentObj = configObj
        
        self.headerImage.image = UIImage(named: configObj.imageName)
        self.titleLabel.text = configObj.name
    }
    
    func setMySwiftCellBlock(_ tempBlock:@escaping MySwiftCellBlock) {
        self.myCellBlock = tempBlock
    }
    
    @IBAction func customButtonClicked(_ sender: UIButton) {
        self.currentObj.name = self.currentObj.name + "1"
        delegate.clickedCurrentButton(self.currentObj.name)
        myCellBlock!(self.currentObj.name)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
