//
//  WebServiceMethods.m
//  beacon
//
//  Created by Asif on 2/16/14.
//  Copyright (c) 2014 Adrenaline Crew. All rights reserved.
//

#import "WebServiceMethods.h"

//API ROOT
NSString * const WS_API_ROOT = @"http://54.235.197.95/WebServices/api.php?method=";
NSString * const localhost = @"http://localhost/api.php?method=";


NSString * const WS_REGISTER_DEVICE = @"registerDevice";
//Sign up web method
NSString * const WS_SEND_PUSH = @"sendPush";
NSString * const WS_SEND_EMAIL = @"sendEmail";
NSString * const WS_CREATE_SUB =@"createSubscription";
NSString * const WS_GET_SUB_STATUS=@"getSubscriptionStatus";
NSString * const WS_CANCEL_SUB = @"cancelSubscription";
