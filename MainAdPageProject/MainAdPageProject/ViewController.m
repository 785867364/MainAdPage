//
//  ViewController.m
//  MainAdPageProject
//
//  Created by 苏军朋 on 2017/1/9.
//  Copyright © 2017年 苏军朋. All rights reserved.
//

#import "ViewController.h"
#import "VersionUpgradeAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *showUpgradeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    showUpgradeBtn.frame = CGRectMake(100,
                                      100,
                                      100,
                                      100);
    showUpgradeBtn.backgroundColor = [UIColor redColor];
    [showUpgradeBtn setTitle:@"更新"
                    forState:UIControlStateNormal];
    [showUpgradeBtn addTarget:self
                       action:@selector(showUpgradeAlertView)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:showUpgradeBtn];
}

-(void)showUpgradeAlertView
{
    
    //show upgrade alert
    
    VersionUpgradeAlertView *versionUpgradeAlert = [VersionUpgradeAlertView shareUpgradeAlertView];
    
    [versionUpgradeAlert showUpgradeAlertWithAlertMsg:@"更新提示!更新提示!更新提示!"
                                      andForceUpgrade:NO];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
