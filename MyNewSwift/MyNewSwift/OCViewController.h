//
//  OCViewController.h
//  MyNewSwift
//
//  Created by gubeidianzi on 16/8/16.
//  Copyright © 2016年 gubeidianzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController

+ (OCViewController *)ocVCWithObj:(id)obj;

@property (strong, nonatomic) NSString *str;

@end
