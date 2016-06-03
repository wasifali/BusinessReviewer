//
//  SignUp.m
//  Business Reviewer
//
//  Created by Wasif Ali on 03/06/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#import "SignUp.h"
#import "Request.h"

@interface SignUp ()

@end

@implementation SignUp

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)SignUp:(id)sender
{
    
    if([_Password.text isEqualToString:@""])
    {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Password Is Missing"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Try Again",nil ] show];
    }
    else
    {
        Request * httpRequest = [[Request alloc] init];
        httpRequest.delegate = (id)self;
        NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _UserName.text,_Password.text];
        [httpRequest loginRequest:loginBody theMethod:@"signup"];
    }
}

- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary
{
    [[[UIAlertView alloc] initWithTitle:@"SignUp" message:@"Signed Up Successfully"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
    //[self performSegueWithIdentifier:@"SignUp" sender:self];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (IBAction)HideKeyBoard:(id)sender
{
    [_UserName resignFirstResponder];
    [_Password resignFirstResponder];
}
@end
