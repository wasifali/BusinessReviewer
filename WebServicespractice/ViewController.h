//
//  ViewController.h
//  WebServicespractice
//
//  Created by SB COMPUTER on 13/08/2014.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)asldjl:(id)sender;
- (IBAction)forgotPassword:(id)sender;
- (IBAction)signUp:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *username;
- (IBAction)Login:(id)sender;

@end
