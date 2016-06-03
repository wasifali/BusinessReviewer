//
//  ViewController.m
//  Business Reviewer
//
//  Created by Wasif Ali on 29/05/2016.
//  Copyright © 2016 Wasif Ali. All rights reserved.
//

#import "ViewController.h"
#import "Request.h"
#import "SignUp.h"
#import <FacebookSDK/FacebookSDK.h>
#import <AddressBook/AddressBook.h>
#import "AppDelegate.h"


@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UILabel *loginLabel;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)Login:(id)sender
{
    Request * httpRequest = [[Request alloc] init];
    httpRequest.delegate = (id)self;
    NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _UserName.text,_Password.text];
    [httpRequest loginRequest:loginBody theMethod:@"login"];
    
}

- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary
{
    NSLog(@"Received Response =  success ==%@",[responseDictionary valueForKey:@"success"]);
    if([[responseDictionary valueForKey:@"success"]isEqualToString:@"true"])
    {
        [self performSegueWithIdentifier:@"LoggedIn" sender:self];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"error" message:@"username or Password is incorrect"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
    }
}

- (IBAction)SignUp:(id)sender
{
    [self performSegueWithIdentifier:@"SignUp" sender:self];
}

- (IBAction)ForgetPassword:(id)sender
{
    [self performSegueWithIdentifier:@"ForgetPassword" sender:self];
}

- (IBAction)hideKeyboard:(id)sender
{
    [_UserName resignFirstResponder];
    [_Password resignFirstResponder];
}

- (IBAction)fb:(id)sender
{
    
    [self prepareForSegue:@"showFriendPicker"sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *identifier = segue.identifier;
    if ([identifier isEqualToString:@"showFriendPicker"]) {
        FBTaggableFriendPickerViewController *taggableFriendPickerViewController = segue.destinationViewController;
        // Set up the taggable friend picker to sort and display names the same way as
        // the iOS Address Book does.
        
        // Need to call ABAddressBookCreate in order for the next two calls to do anything.
        //  ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        taggableFriendPickerViewController.sortOrdering = (ABPersonGetSortOrdering() == kABPersonSortByFirstName ? FBFriendSortByFirstName : FBFriendSortByLastName);
        taggableFriendPickerViewController.displayOrdering = (ABPersonGetCompositeNameFormat() == kABPersonCompositeNameFormatFirstNameFirst ? FBFriendDisplayByFirstName : FBFriendDisplayByLastName);
        //  CFRelease(addressBook);
        
        [taggableFriendPickerViewController loadData];
        taggableFriendPickerViewController.delegate = self;
    }
}







@end
