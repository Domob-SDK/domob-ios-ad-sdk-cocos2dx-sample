//
//  TestCocosXAppController.h
//  TestCocosX
//
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMInterstitialAdController.h"


@interface RootViewController : UIViewController <DMInterstitialAdControllerDelegate>{

}
@property (nonatomic, retain) DMInterstitialAdController *interstitial;
@end
