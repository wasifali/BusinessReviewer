//
//  Request.h
//  beacon
//
//  Created by Asif on 2/16/14.
//  Copyright (c) 2014 Adrenaline Crew. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "RequestDelegate.h"
#import "WebServiceMethods.h"

@interface Request : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) id<RequestDelegate> delegate;
@property (nonatomic, strong) NSMutableData *responseData;

@property (nonatomic) int statusCode;


- (void) requestWithPostBody:(NSString *)postBody theMethod:(NSString *)theMethod andProgressMessage:(NSString*)progressMessage;
- (void) requestWithSimplePostBody:(NSString *)postBody theMethod:(NSString *)theMethod andProgressMessage:(NSString *)progressMessage;
- (void) loginRequest:(NSString *)loginBody
            theMethod:(NSString *)theMethod;

+ (Request *)sharedInstance;


@end