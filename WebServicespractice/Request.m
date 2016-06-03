//
//  Request.m
//  beacon
//
//  Created by Asif on 2/16/14.
//  Copyright (c) 2014 Adrenaline Crew. All rights reserved.
//

#import "Request.h"
#import "Reachability.h"
//#import "SVProgressHUD.h"

@interface Request (PrivateMethods)
- (void) setApplicationNetworkActivityIndicator:(BOOL) value;
- (void) dismiss;
@end

@implementation Request {
@private
    id <RequestDelegate> _delegate;
    NSMutableData *_responseData;
    int _statusCode;
    NSString *_requestMethod;
}

@synthesize delegate = _delegate;
@synthesize responseData = _responseData;
@synthesize statusCode = _statusCode;


+ (Request *)sharedInstance {
    static Request *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    
    return _instance;
}
- (void) loginRequest:(NSString *)loginBody
            theMethod:(NSString *)theMethod{
    
    NetworkStatus internetStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    
    if (internetStatus != NotReachable) {
        //  [SVProgressHUD showWithStatus:progressMessage maskType:SVProgressHUDMaskTypeClear];
        [self setApplicationNetworkActivityIndicator:YES];
        NSURL *url  = nil;
      
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@",localhost, theMethod,loginBody]];
        NSLog(@"hey %@",url);
        
        _requestMethod = theMethod;
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:400];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [[NSURLConnection connectionWithRequest:request delegate:self] start];
        

        
        
    } else{
        
        [[[UIAlertView alloc] initWithTitle:@"Internet Disconnected" message:[NSString stringWithFormat:@"Please check your internet connection: Status code:%u",internetStatus ] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
        // [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"NetworkNotAvailable", nil)];
    }

    
}


- (void) requestWithPostBody:(NSString *)postBody
                   theMethod:(NSString *)theMethod
          andProgressMessage:(NSString *)progressMessage {
    
    NetworkStatus internetStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    
    if (internetStatus != NotReachable) {
        // [SVProgressHUD showWithStatus:progressMessage maskType:SVProgressHUDMaskTypeClear];
        [self setApplicationNetworkActivityIndicator:YES];
        
        NSURL *url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@",WS_API_ROOT, theMethod]];
        
        _requestMethod = theMethod;
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:60];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:[postBody dataUsingEncoding:NSUTF8StringEncoding]];
        [[NSURLConnection connectionWithRequest:request delegate:self] start];
        
#ifdef DEBUG
        NSLog(@"%@\n", url);
        NSLog(@"%@\n",request);
        NSLog(@"%@\n",postBody);
#endif
        
        
    } else{
        [[[UIAlertView alloc] initWithTitle:@"Internet Disconnected" message:[NSString stringWithFormat:@"Please check your internet connection: Status code:%u",internetStatus ] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
        // [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"NetworkNotAvailable", nil)];
    }
    
    
}

- (void)requestWithSimplePostBody:(NSString *)postBody
                        theMethod:(NSString *)theMethod
               andProgressMessage:(NSString *)progressMessage {
    
    NetworkStatus internetStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    
    if (internetStatus != NotReachable) {
        //  [SVProgressHUD showWithStatus:progressMessage maskType:SVProgressHUDMaskTypeClear];
        [self setApplicationNetworkActivityIndicator:YES];
        NSURL *url  = nil;
        if (postBody) {
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@%@",WS_API_ROOT, theMethod,postBody]];
        } else {
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"%@%@",WS_API_ROOT, theMethod]];
        }
        
        _requestMethod = theMethod;
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:400];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [[NSURLConnection connectionWithRequest:request delegate:self] start];
        
        
#ifdef DEBUG
        NSLog(@"%@\n", url);
        NSLog(@"%@\n",request);
        NSLog(@"%@\n",postBody);
#endif
        
        
    } else{
        
        [[[UIAlertView alloc] initWithTitle:@"Internet Disconnected" message:[NSString stringWithFormat:@"Please check your internet connection: Status code:%u",internetStatus ] delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil ] show];
        // [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"NetworkNotAvailable", nil)];
    }
}


#pragma mark - Private Methods
- (void)setApplicationNetworkActivityIndicator:(BOOL)value {
    UIApplication *application = [UIApplication sharedApplication];
    [application setNetworkActivityIndicatorVisible:value];
    
}

- (void) dismiss {
    
    [self setApplicationNetworkActivityIndicator:NO];
    //[SVProgressHUD dismiss];
    [self.responseData setLength:0];
    
}

#pragma mark - NSURLConnectionDelegate Methods
- (void)connection:(NSURLConnection *)connection
didReceiveResponse:(NSURLResponse *)response {
    [self dismiss];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
    self.statusCode = [httpResponse statusCode];
    
    if (!self.responseData)
        self.responseData = [[NSMutableData alloc] init];
    else
        [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection
    didReceiveData:(NSData *)data {
    
    
    
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if (self.statusCode == 200 || self.statusCode == 204) {
        NSError* error;
        NSLog(@"Response data is : %@",self.responseData);
        NSArray *response = [NSJSONSerialization JSONObjectWithData:self.responseData options:(kNilOptions) error:&error];
        
        
        //        //code written to filter the tracking code due to using free hosting and domain
        //        NSString *myString = [[NSString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
        //        NSArray * mydata = [myString componentsSeparatedByString:@"}\r"];
        //        NSString * filteredString = [NSString stringWithFormat:@"%@%@", mydata[0],@"}"];
        //        NSData * filteredData= [filteredString dataUsingEncoding:NSUTF8StringEncoding];
        [self.delegate requestFinishedSuccessfully:self withDictionaryInResponse:[NSJSONSerialization JSONObjectWithData:self.responseData//1
                                                                                                                 options:kNilOptions
                                                                                                                   error:&error]];
//#ifdef DEBUG
        // NSError* error;
        NSLog(@"Actual Data is %@\n", [NSJSONSerialization JSONObjectWithData:self.responseData
                                                                      options:kNilOptions
                                                                        error:&error]);
//#endif
    }
    
    
    
    
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error {
    
    [self dismiss];
    //  [SVProgressHUD showErrorWithStatus:[error localizedDescription]];
}


@end

