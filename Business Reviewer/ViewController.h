//
//  ViewController.h
//  Business Reviewer
//
//  Created by Wasif Ali on 29/05/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController<FBFriendPickerDelegate>

- (IBAction)Login:(id)sender;
- (IBAction)SignUp:(id)sender;
- (IBAction)ForgetPassword:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)fb:(id)sender;

@end
