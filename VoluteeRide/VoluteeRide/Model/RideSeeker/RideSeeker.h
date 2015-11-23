//
//  RideSeeker.h
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RideSeeker : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *createdDatetime;
@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *centerId;
@property (nonatomic, strong) NSArray *userRoles;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, assign) double version;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) id ownedVehicles;
@property (nonatomic, strong) NSString *lastName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
