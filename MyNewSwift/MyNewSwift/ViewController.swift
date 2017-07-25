//
//  ViewController.swift
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/12.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

import UIKit

typealias testBlock = (Int) -> Void

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate, MySwiftCellDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var myTestBlock : testBlock!
    
    var ocvc = OCViewController()
    
//    var customSObj = CustomSwiftObject()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
//        print("calculate result is ",plus(2,3))
//
//        print(addTwoNumbers(numberOne: 1, numberTwo: 2))
//        
//        funcWithBlock(2, b: 3) { (sum:Int) in
//            print("sum is",sum)
//        }
        
        CustomSwiftObject.sharedInstance.name = "shabi"
        print(CustomSwiftObject.sharedInstance.name)
    }
    
    func funcWithBlock(_ a:Int,b:Int,block:testBlock) {
        block(a+b)
    }
    
    func addTwoNumbers(numberOne number1:Int,numberTwo number2:Int) -> Int {
        return number1+number2
    }
    
    var plus:(Int,Int)->Int = {
        (a,b) in
        
        return a+b
    }
    
    func myFunc(_ a:Int,b:Int,fun:(_ c:Int,_ d:Int)->Int)->Int
    {
        let e = a+b
        return e
    }
    
    lazy var array : NSMutableArray = {
        let obj1 = TableViewConfig().configObj("name1",imageName: "J3500",selector: "selector1")
        let obj2 = TableViewConfig().configObj("name2",imageName: "T320S",selector: "selector2")
        let obj3 = TableViewConfig().configObj("name3",imageName: "T320SC",selector: "selector3")
        let obj4 = TableViewConfig().configObj("name4",imageName: "T320S",selector: "selector4")
        
        return [obj1,obj2,obj3,obj4]
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MySwiftCell()), for: indexPath) as! MySwiftCell
        cell.delegate = self
        cell.setConfigObj(self.array[indexPath.row] as! TableViewConfig)
        cell.setMySwiftCellBlock { (name : String) in
            print("current name is ",name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(CustomSwiftObject.sharedInstance)
        
        let obj = self.array[indexPath.row] as! TableViewConfig

        self.perform(NSSelectorFromString(obj.selector))
    }
    
    func clickedCurrentButton(_ name: String) {
        print(name)
        
        self.tableView.reloadData()
    }
    
    func selector1() {
        let alertController = UIAlertController.init(title: "当前行", message: "11", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            print("haha")
        }
        
        let okAction = UIAlertAction(title: "好的", style: UIAlertActionStyle.default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
    func selector2() {
        self.navigationController?.pushViewController(ThirdViewController().thirdVC({ (labelName:String) in
            let obj = self.array[0] as! TableViewConfig
            obj.name = labelName
            self.tableView.reloadData()
        }), animated: true)
    }
    
    func selector3() {
        let obj = self.array[2] as! TableViewConfig
        
        self.navigationController?.pushViewController(SecondViewController().secondVCWithSource(obj), animated: true)
    }
    
    func selector4() {
        //调用oc类
        self.navigationController?.pushViewController(OCViewController.ocVC(withObj: self.array[3]), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

