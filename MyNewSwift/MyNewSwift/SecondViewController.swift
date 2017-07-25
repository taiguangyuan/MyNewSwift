//
//  SecondViewController.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/12.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var currentObj = TableViewConfig()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.currentImage.image = UIImage(named: self.currentObj.imageName)
        self.nameLabel.text = self.currentObj.name
    }
    
    
    func secondVCWithSource(_ obj : TableViewConfig) -> SecondViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SecondViewController())) as! SecondViewController
        vc.currentObj = obj
        
        return vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
