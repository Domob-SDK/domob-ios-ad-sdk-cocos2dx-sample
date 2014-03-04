//
//  TestCocosXAppController.h
//  TestCocosX
//
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//

#import "RootViewController.h"
#define DMPLACEMENT_ID   @"56OJyM1ouMGoULfJaL"
#define DM_INTERSTITIAL_PUBLISHER_ID @"16TLwebvAchkAY6iOWkE6kpk"

@implementation RootViewController


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
        [self insterstitialAD];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
 
*/
// Override to allow orientations other than the default portrait orientation.
// This method is deprecated on ios6
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape( interfaceOrientation );
}

// For ios6, use supportedInterfaceOrientations & shouldAutorotate instead
- (NSUInteger) supportedInterfaceOrientations{
#ifdef __IPHONE_6_0
    return UIInterfaceOrientationMaskAllButUpsideDown;
#endif
}

- (BOOL) shouldAutorotate {
    return YES;
}

#pragma mark-- insterstitial
-(void)insterstitialAD
{
    _interstitial = [[DMInterstitialAdController alloc] initWithPublisherId:DMPLACEMENT_ID
                                                                placementId:DM_INTERSTITIAL_PUBLISHER_ID
                                                         rootViewController:self];
    _interstitial.delegate = self;
    [_interstitial loadAd];
    
}
- (void)showInterstitial{
    NSLog(@"1 showInterstitial");
    if (_interstitial) {
        if ([_interstitial isReady]) {
            NSLog(@"2 showInterstitial");
            [_interstitial present];
        }
    }
}
#pragma mark Delegate
- (void)dmInterstitialSuccessToLoadAd:(DMInterstitialAdController *)dmInterstitial
{
    NSLog(@"dmInterstitialSuccessToLoadAd");
    //建议在合适的时间调用显示广告的方法 此Demo时加载成功直接显示
    [self showInterstitial];
}
// 当插屏广告加载失败后，回调该方法
- (void)dmInterstitialFailToLoadAd:(DMInterstitialAdController *)dmInterstitial withError:(NSError *)err
{
    NSLog(@"dmInterstitialFailToLoadAd");
}
// 当插屏广告被点击后，回调该方法
- (void)dmInterstitialDidClicked:(DMInterstitialAdController *)dmInterstitial
{
     NSLog(@"dmInterstitialDidClicked");
}

// 当插屏广告要被呈现出来前，回调该方法
- (void)dmInterstitialWillPresentScreen:(DMInterstitialAdController *)dmInterstitial
{
   NSLog(@"dmInterstitialWillPresentScreen");
}
// 当插屏广告被关闭后，回调该方法
- (void)dmInterstitialDidDismissScreen:(DMInterstitialAdController *)dmInterstitial
{
     NSLog(@"dmInterstitialDidDismissScreen");
}

// 当将要呈现出 Modal View 时，回调该方法。如打开内置浏览器。
- (void)dmInterstitialWillPresentModalView:(DMInterstitialAdController *)dmInterstitial
{
     NSLog(@"dmInterstitialWillPresentModalView");
}
// 当呈现的 Modal View 被关闭后，回调该方法。如内置浏览器被关闭。
- (void)dmInterstitialDidDismissModalView:(DMInterstitialAdController *)dmInterstitial
{
     NSLog(@"dmInterstitialDidDismissModalView");
}
// 当因用户的操作（如点击下载类广告，需要跳转到Store），需要离开当前应用时，回调该方法
- (void)dmInterstitialApplicationWillEnterBackground:(DMInterstitialAdController *)dmInterstitial
{
     NSLog(@"dmInterstitialApplicationWillEnterBackground");
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}





@end
