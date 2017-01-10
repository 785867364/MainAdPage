//
//  VersionUpgradeAlertView.m
//  MainAdPage
//
//  Created by asphg on 2016/11/23.
//  Copyright © 2016年 asphg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VersionUpgradeAlertView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *upgradeTextScrollView;
@property (weak, nonatomic) IBOutlet UIButton *confirmUpgradeBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelUpgradeBtn;
@property (weak, nonatomic) IBOutlet UIButton *forceUpgradeBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *upgradeViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *upgradeViewWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *confirmUpgradeBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cancelUpgradeBtnHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *forceUpgradeBtnHeight;

///更新提示文本框
@property (strong, nonatomic) UILabel *upgradeTextLabel;
///是否强制更新
@property (nonatomic,assign) BOOL forceUpgrade;


+ (VersionUpgradeAlertView *)shareUpgradeAlertView;

///弹出升级提示框
-(void)showUpgradeAlertWithAlertMsg:(NSString *)alertMsg
                    andForceUpgrade:(BOOL)forceUpgrade;


@end
