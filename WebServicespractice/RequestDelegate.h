//
//  RequestDelegate.h
//  beacon
//
//  Created by Asif on 2/16/14.
//  Copyright (c) 2014 Adrenaline Crew. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Request;

@protocol RequestDelegate <NSObject>

@optional

- (void)RequestFinishedSuccessfully:(Request *)request withNSDataResponse:(NSData *)data;
- (void)requestFinishedSuccessfully:(Request *)request withStringResponse:(NSString *)responseString;
- (void)requestFinishedSuccessfully:(Request *)request withDictionaryInResponse:(NSMutableDictionary *)responseDictionary;
- (void)requestFinished:(Request *)request withError:(NSError *)error;


@end