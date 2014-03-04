//
//  TestCocosXAppController.h
//  TestCocosX
//
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//
#import "DMAdView.h"

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate,
                                        UITextFieldDelegate,UIApplicationDelegate,DMAdViewDelegate> {
    UIWindow *window;
    RootViewController    *viewController;
    DMAdView *_dmAdView;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) RootViewController *viewController;

@end

