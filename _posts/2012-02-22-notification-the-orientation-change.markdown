---
layout: post
title: "监听iOS检测屏幕旋转状态，不需开启屏幕旋转"
date: 2012-02-22 16:40
comments: true
tags: 
    - ios
---

## 问题

适用情形，当我们并不需要整屏自动转动，而只需其中一两个小组件转动而已，这个办法就有用了。

```c
-(void)rotation_icon:(float)n {
    UIButton *history_btn = [self.viewviewWithTagName:@"home_history"];

    UIButton *cam_btn = [self.viewviewWithTagName:@"cam_btn"];

    UIButton *cut_btn = [self.viewviewWithTagName:@"cut_btn"];    

    UIButton *light_btn = [self.viewviewWithTagName:@"light_btn"];

    

    history_btn.transform = CGAffineTransformMakeRotation(n*M_PI/180.0);

    cam_btn.transform = CGAffineTransformMakeRotation(n*M_PI/180.0);

    cut_btn.transform = CGAffineTransformMakeRotation(n*M_PI/180.0);

    light_btn.transform = CGAffineTransformMakeRotation(n*M_PI/180.0);

}



- (void)orientationChanged:(NSNotification *)note

{

    UIDeviceOrientation o = [[UIDevicecurrentDevice] orientation];

    switch (o) {

        caseUIDeviceOrientationPortrait:            // Device oriented vertically, home button on the bottom  
            [self  rotation_icon:0.0];

            break;

        caseUIDeviceOrientationPortraitUpsideDown:  // Device oriented vertically, home button on the top
            [self  rotation_icon:180.0];

            break;

        caseUIDeviceOrientationLandscapeLeft:      // Device oriented horizontally, home button on the right
            [self  rotation_icon:90.0*3];

            break;

        caseUIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left
            [self  rotation_icon:90.0];

            break;

        default:

            break;

    }

}





-(void)viewWillDisappear:(BOOL)animated {

    NSNotificationCenter *nc = [NSNotificationCenterdefaultCenter];

    UIDevice *device = [UIDevicecurrentDevice]; //Get the device object
    

    [nc removeObserver:selfname:UIDeviceOrientationDidChangeNotificationobject:device];
    
}



- (void)viewDidAppear:(BOOL)animated {

    // Do any additional setup after loading the view from its nib.

    

    //----- SETUP DEVICE ORIENTATION CHANGE NOTIFICATION -----

    

    UIDevice *device = [UIDevicecurrentDevice]; //Get the device object
    

    [device beginGeneratingDeviceOrientationNotifications]; //Tell it to start monitoring the accelerometer for orientation

    

    NSNotificationCenter *nc = [NSNotificationCenterdefaultCenter]; //Get the notification centre for the app
    

    [nc addObserver:self//Add yourself as an observer
     

           selector:@selector(orientationChanged:)

     

               name:UIDeviceOrientationDidChangeNotification

     

             object:device];

}
```
