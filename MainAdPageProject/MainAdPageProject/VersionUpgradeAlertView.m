//
//  VersionUpgradeAlertView.m
//  MainAdPage
//
//  Created by asphg on 2016/11/23.
//  Copyright © 2016年 asphg. All rights reserved.
//

#import "VersionUpgradeAlertView.h"
#import "NSString+Utility.h"
#import "AppDelegate.h"

#define APP_SCREEN_WIDTH                [UIScreen mainScreen].bounds.size.width
#define APP_SCREEN_HEIGHT               [UIScreen mainScreen].bounds.size.height
#define MainScreenBounds                [UIScreen mainScreen].bounds


static VersionUpgradeAlertView *shareInstance = nil;

@implementation VersionUpgradeAlertView

+(VersionUpgradeAlertView *)shareUpgradeAlertView{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shareInstance = [[[NSBundle mainBundle]loadNibNamed:@"VersionUpgradeAlertView"
                                                      owner:nil
                                                    options:nil] lastObject];
        [shareInstance setFrame:[UIScreen mainScreen].bounds];
    });
    
    return shareInstance;
}


///弹出升级提示框
-(void)showUpgradeAlertWithAlertMsg:(NSString *)alertMsg
                    andForceUpgrade:(BOOL)forceUpgrade
{
    
    //计算不同屏幕下 view/btn 的 宽度/高度
    CGFloat realUpgradeViewWidth = [self calculateLengthFromMultipleScreenSizeWithLength:260];
    CGFloat realUpgradeBtnHeight = [self calculateLengthFromMultipleScreenSizeWithLength:30];
    
    self.upgradeViewWidth.constant = realUpgradeViewWidth;
    self.confirmUpgradeBtnHeight.constant = realUpgradeBtnHeight;
    self.cancelUpgradeBtnHeight.constant = realUpgradeBtnHeight;
    self.forceUpgradeBtnHeight.constant = realUpgradeBtnHeight;
    
    
    //计算更新文本的高度，设置scrollview
    CGFloat upgradeTextHeight = [alertMsg getStringHeight:[UIFont fontWithName:@"Helvetica"
                                                                          size:15]
                                                    width:realUpgradeViewWidth-40];
    
    self.forceUpgrade = forceUpgrade;
    
    self.upgradeTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,
                                                                     0,
                                                                     realUpgradeViewWidth-40,
                                                                     upgradeTextHeight)];
    self.upgradeTextLabel.font = [UIFont fontWithName:@"Helvetica"
                                                 size:15];
    self.upgradeTextLabel.textColor = [UIColor blackColor];
    self.upgradeTextLabel.text = alertMsg;
    self.upgradeTextLabel.numberOfLines = 0;
    
    self.upgradeTextScrollView.contentSize = CGSizeMake(realUpgradeViewWidth-40,
                                                        upgradeTextHeight);
    [self.upgradeTextScrollView addSubview:self.upgradeTextLabel];
    
    
    //尽可能显示出更新文字
    CGFloat realTextHeight = self.upgradeViewHeight.constant + (upgradeTextHeight - 83);
    
    if (upgradeTextHeight > 83) {
        
        if (realTextHeight > (APP_SCREEN_HEIGHT - 160)) {
            
            self.upgradeViewHeight.constant = APP_SCREEN_HEIGHT - 160;
        }else{
            
            self.upgradeViewHeight.constant = realTextHeight;
        }
    }
    
    
    _confirmUpgradeBtn.hidden = YES;
    _cancelUpgradeBtn.hidden = YES;
    _forceUpgradeBtn.hidden = YES;
    
    if (forceUpgrade) {
        
        _forceUpgradeBtn.hidden = NO;
        [_forceUpgradeBtn addTarget:self
                             action:@selector(confirmUpgradeMethod)
                   forControlEvents:UIControlEventTouchUpInside];
        
    }else{
        
        _confirmUpgradeBtn.hidden = NO;
        _cancelUpgradeBtn.hidden = NO;
        
        [_confirmUpgradeBtn addTarget:self
                               action:@selector(confirmUpgradeMethod)
                     forControlEvents:UIControlEventTouchUpInside];
        [_cancelUpgradeBtn addTarget:self
                               action:@selector(cancenUpgradeMethod)
                     forControlEvents:UIControlEventTouchUpInside];
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    [appDelegate.window addSubview:self];
    
}

///确认更新
-(void)confirmUpgradeMethod
{
    
    if (!self.forceUpgrade) {
        
        [self removeFromSuperview];
    }
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"you appstore address"]];
    
}

///取消更新
-(void)cancenUpgradeMethod
{
    
    if (!self.forceUpgrade) {
        
        [self removeFromSuperview];
    }
}


/**
 *  计算不同尺寸控件在不同屏幕下的比例
 */
-(CGFloat)calculateLengthFromMultipleScreenSizeWithLength:(CGFloat)length
{
    
    //不同屏幕下的比例
    CGFloat multipleRate = (APP_SCREEN_WIDTH-320)/320;
    
    //不同屏幕尺寸下相差的大小
    CGFloat multipleDifferLength = multipleRate * length;
    
    return length + multipleDifferLength;
}



@end
