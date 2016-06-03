//
//  AppDelegate.h
//  Business Reviewer
//
//  Created by Wasif Ali on 29/05/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>


@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) MViewController *rootViewController;
@property (strong, nonatomic) UIWindow *window;

@end
