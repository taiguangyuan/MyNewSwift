//
//  ThirdViewController.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/12.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

import UIKit

typealias thirdViewBlock = (String) -> Void

class ThirdViewController: UIViewController {

    var thirdBlock : thirdViewBlock?
    
    @IBOutlet weak var thirdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func thirdButtonTouchup(_ sender: AnyObject) {
        self.thirdBlock!(self.thirdLabel.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    func thirdVC(_ block:@escaping thirdViewBlock) -> ThirdViewController {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ThirdViewController())) as! ThirdViewController
        vc.thirdBlock = block
        
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
