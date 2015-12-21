//
//  VRRequestor.h
//  VoluteeRide
//
//  Created by Karim Abdul on 12/13/15.
//  Copyright © 2015 Karim Abdul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^completion)(void (^)(AFHTTPRequestOperation *op,id resp));

@interface VRRequestor : NSObject

+ (VRRequestor *)sharedInstance;

- (void)getJKLocation:(NSString *)centerId completed:(void (^)(AFHTTPRequestOperation *op,id resp))response;

- (void)getJKLocations:(void (^)(AFHTTPRequestOperation *op,id resp))response;

- (void)registerUser:(NSDictionary *)parameters completed:(void (^)(AFHTTPRequestOperation *op, id resp))response;

@end
