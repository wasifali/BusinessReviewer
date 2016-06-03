//
//  SignUp.h
//  Business Reviewer
//
//  Created by Wasif Ali on 03/06/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#ifndef SignUp_h
#define SignUp_h

#import <UIKit/UIKit.h>

@interface SignUp : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *Password;
- (IBAction)SignUp:(id)sender;
- (IBAction)HideKeyBoard:(id)sender;

@end



#endif /* SignUp_h */
