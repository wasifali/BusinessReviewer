//
//  SignUpController.h
//  WebServicespractice
//
//  Created by SB COMPUTER on 13/08/2014.
//  Copyright (c) 2014 SB COMPUTER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *username;
- (IBAction)signUp:(id)sender;



@end
