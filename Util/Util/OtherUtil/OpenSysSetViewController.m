//
//  OpenSysSetViewController.m
//  Util
//
//  Created by 吴孟钦 on 16/10/11.
//  Copyright © 2016年 吴孟钦. All rights reserved.
//

#import "OpenSysSetViewController.h"

@interface OpenSysSetViewController ()

@end

@implementation OpenSysSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 //iOS8之后
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
 //如果App没有添加权限，显示的是设定界面。如果App有添加权限（例如通知），显示的是App的设定界面。
 */


/**
 //iOS8之前
 //先添加一个url type如下图，在代码中调用如下代码,即可跳转到设置页面的对应项
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
 
 可选值如下：
 About — prefs:root=General&path=About
 Accessibility — prefs:root=General&path=ACCESSIBILITY
 Airplane Mode On — prefs:root=AIRPLANE_MODE
 Auto-Lock — prefs:root=General&path=AUTOLOCK
 Brightness — prefs:root=Brightness
 Bluetooth — prefs:root=General&path=Bluetooth
 Date & Time — prefs:root=General&path=DATE_AND_TIME
 FaceTime — prefs:root=FACETIME
 General — prefs:root=General
 Keyboard — prefs:root=General&path=Keyboard
 iCloud — prefs:root=CASTLE
 iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
 International — prefs:root=General&path=INTERNATIONAL
 Location Services — prefs:root=LOCATION_SERVICES
 Music — prefs:root=MUSIC
 Music Equalizer — prefs:root=MUSIC&path=EQ
 Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
 Network — prefs:root=General&path=Network
 Nike + iPod — prefs:root=NIKE_PLUS_IPOD
 Notes — prefs:root=NOTES
 Notification — prefs:root=NOTIFICATI*****_ID
 Phone — prefs:root=Phone
 Photos — prefs:root=Photos
 Profile — prefs:root=General&path=ManagedConfigurationList
 Reset — prefs:root=General&path=Reset
 Safari — prefs:root=Safari
 Siri — prefs:root=General&path=Assistant
 Sounds — prefs:root=Sounds
 Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
 Store — prefs:root=STORE
 Twitter — prefs:root=TWITTER
 Usage — prefs:root=General&path=USAGE
 VPN — prefs:root=General&path=Network/VPN
 Wallpaper — prefs:root=Wallpaper
 Wi-Fi — prefs:root=WIFI
 */

@end
