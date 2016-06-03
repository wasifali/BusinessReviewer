#import "ViewController.h"
//#import "SignUpController.h"
#import "Request.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)Login:(id)sender {
        Request * httpRequest = [[Request alloc] init];
        httpRequest.delegate = (id)self;
        NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _username.text,_password.text];
        [httpRequest loginRequest:loginBody theMethod:@"login"];
}
- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary{
    NSLog(@"Received Response =  success ==%@",[responseDictionary valueForKey:@"success"]);
    if([[responseDictionary valueForKey:@"success"]isEqualToString:@"true"]){
        [self performSegueWithIdentifier:@"info" sender:self];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"error" message:@"username or password is incorrect"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
    }
}

- (IBAction)forgotPassword:(id)sender {
    [self performSegueWithIdentifier:@"forgot" sender:self];
    
}

- (IBAction)signUp:(id)sender {
    [self performSegueWithIdentifier:@"signup" sender:self];
}
- (IBAction)hideKeyboard:(id)sender {
    [_username resignFirstResponder];
    [_password resignFirstResponder];
}
@end