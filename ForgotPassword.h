//
//  ForgotPassword.h
//  Business Reviewer
//
//  Created by Wasif Ali on 03/06/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#ifndef ForgotPassword_h
#define ForgotPassword_h

#import <UIKit/UIKit.h>

@interface ForgotPassword : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)Reset:(id)sender;

@end




#endif /* ForgotPassword_h */
