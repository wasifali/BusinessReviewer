//
//  SignUpController.m
//  WebServicespractice
//
//  Created by SB COMPUTER on 13/08/2014.
//  Copyright (c) 2014 SB COMPUTER. All rights reserved.
//

#import "SignUpController.h"
#import "Request.h"

@interface SignUpController ()

@end

@implementation SignUpController

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

/*- (IBAction)SignUp:(id)sender {
    Request * httpRequest = [[Request alloc] init];
    httpRequest.delegate = (id)self;
    NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _username.text,_password.text];
    [httpRequest loginRequest:loginBody theMethod:@"signup"];
    [self.navigationController popViewControllerAnimated:YES];
}*/
- (IBAction)signUp:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    Request * httpRequest = [[Request alloc] init];
    httpRequest.delegate = (id)self;
    NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _username.text,_password.text];
    [httpRequest loginRequest:loginBody theMethod:@"signup"];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary{
}
@end
