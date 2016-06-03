

#import "ForgotPassword.h"
#import "Request.h"

@interface ForgotPassword ()


@end

@implementation ForgotPassword
{
    NSString *success;
}

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

- (IBAction)changePassword:(id)sender {
    Request * httpRequest = [[Request alloc] init];
    httpRequest.delegate = (id)self;
    NSString * loginBody = [NSString stringWithFormat:@"&username=%@&password=%@", _username.text,_password.text];
    [httpRequest loginRequest:loginBody theMethod:@"forgot"];
}
- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary{
    success = [responseDictionary valueForKey:@"success"];
    
    if([[responseDictionary valueForKey:@"success"]isEqualToString:@"true"]){
        [[[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"password is successfully changed"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
    }
    else{
        [[[UIAlertView alloc] initWithTitle:@"error" message:@"username does not exist"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil ] show];

    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if([success isEqualToString:@"true"]){
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
