//
//  VRRequestor.m
//  VoluteeRide
//
//  Created by Karim Abdul on 12/13/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import "VRRequestor.h"

static VRRequestor *_sharedInstance = nil;

@interface VRRequestor ()

@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) NSString *jkCenterString;
@property (nonatomic, strong) NSString *registerUserString;

@end

@implementation VRRequestor

+ (VRRequestor *)sharedInstance {
    static dispatch_once_t onceQueue;
    
    dispatch_once(&onceQueue, ^{
        _sharedInstance = [[VRRequestor alloc] init];
    });
    
    return _sharedInstance;
}


- (NSURL*)baseURL {
    
    if (!_baseURL) {
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        NSString *serverURL = [infoDict objectForKey:@"SERVER_URL"];
        _baseURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",serverURL]];
    }
    return _baseURL;
}

- (NSString*)jkCenterString {
    
    if (!_jkCenterString) {
        _jkCenterString = @"centers";
    }
    return _jkCenterString;
}

- (NSString*)registerUserString {
    
    if (!_registerUserString) {
        _registerUserString = @"users";
    }
    return _registerUserString;
}

- (void)getJKLocation:(NSString *)centerId completed:(void (^)(AFHTTPRequestOperation *op,id resp))response {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
    
    NSString *jkLookupURL = [NSString stringWithFormat:@"%@/%@/%@", self.baseURL, self.jkCenterString,centerId];
    
    [manager GET:jkLookupURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,responseObject);
        });
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,error);
        });
    }];
}

- (void)getJKLocations:(void (^)(AFHTTPRequestOperation *op,id resp))response {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    [manager.requestSerializer setValue:@"" forHTTPHeaderField:@"Accept-Encoding"];
    
    NSString *jkLookupURL = [NSString stringWithFormat:@"%@/%@", self.baseURL, self.jkCenterString];
    
    [manager GET:jkLookupURL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,responseObject);
        });
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,error);
        });
    }];
}

- (void)registerUser:(NSDictionary *)parameters completed:(void (^)(AFHTTPRequestOperation *op, id resp))response {
    
    AFSecurityPolicy *policy = [[AFSecurityPolicy alloc] init];
    [policy setAllowInvalidCertificates:YES];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    [manager setSecurityPolicy:policy];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *registerUserURL = [NSString stringWithFormat:@"%@/%@", self.baseURL, self.registerUserString];
    
    [manager POST:registerUserURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //        NSLog(@"JSON: %@", responseObject);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,responseObject);
        });
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"JSON: %@", error);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (response != nil)
                response(operation,error);
        });
    }];
}

@end
