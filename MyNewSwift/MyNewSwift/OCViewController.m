//
//  OCViewController.m
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/16.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

#import "OCViewController.h"
#import "SwiftModule-Swift.h"

@interface OCViewController ()

@property (strong, nonatomic) TableViewConfig *currentObj;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //调用swift类
    TableViewConfig *obj = [[TableViewConfig alloc] init];
    obj.name = @"hello";
    obj.imageName = @"good";
    NSLog(@"tableconfig objName is %@",obj.name);
    NSLog(@"currentObj objName is %@",self.currentObj.name);

    NSLog(@"%@",CustomSwiftObject.sharedInstance);
    NSLog(@"%@",CustomSwiftObject.sharedInstance.name);
}

+ (OCViewController *)ocVCWithObj:(id)obj
{
    OCViewController *vc = [[UIStoryboard storyboardWithName:@"OCTest" bundle:nil] instantiateViewControllerWithIdentifier:NSStringFromClass([OCViewController class])];
    vc.currentObj = (TableViewConfig *)obj;
    
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
