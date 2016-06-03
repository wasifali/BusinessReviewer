//
//  ForgotPassword.h
//  WebServicespractice
//
//  Created by Ijaz on 18/08/2014.
//  Copyright (c) 2014 Ijaz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPassword : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *password;
- (IBAction)password:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *username;
- (IBAction)changePassword:(id)sender;

@end
