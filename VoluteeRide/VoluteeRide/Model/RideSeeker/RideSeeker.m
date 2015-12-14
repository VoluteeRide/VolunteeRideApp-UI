//
//  RideSeeker.m
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "RideSeeker.h"


NSString *const kRideSeekerPhone = @"phone";
NSString *const kRideSeekerFirstName = @"firstName";
NSString *const kRideSeekerCreatedDatetime = @"createdDatetime";
NSString *const kRideSeekerId = @"id";
NSString *const kRideSeekerCenterId = @"centerId";
NSString *const kRideSeekerUserRoles = @"userRoles";
NSString *const kRideSeekerUsername = @"username";
NSString *const kRideSeekerVersion = @"version";
NSString *const kRideSeekerEmail = @"email";
NSString *const kRideSeekerOwnedVehicles = @"ownedVehicles";
NSString *const kRideSeekerLastName = @"lastName";


@interface RideSeeker ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RideSeeker

@synthesize phone = _phone;
@synthesize firstName = _firstName;
@synthesize createdDatetime = _createdDatetime;
@synthesize rideSeekerIdentifier = _rideSeekerIdentifier;
@synthesize centerId = _centerId;
@synthesize userRoles = _userRoles;
@synthesize username = _username;
@synthesize version = _version;
@synthesize email = _email;
@synthesize ownedVehicles = _ownedVehicles;
@synthesize lastName = _lastName;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.phone = [self objectOrNilForKey:kRideSeekerPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kRideSeekerFirstName fromDictionary:dict];
            self.createdDatetime = [self objectOrNilForKey:kRideSeekerCreatedDatetime fromDictionary:dict];
            self.rideSeekerIdentifier = [self objectOrNilForKey:kRideSeekerId fromDictionary:dict];
            self.centerId = [self objectOrNilForKey:kRideSeekerCenterId fromDictionary:dict];
            self.userRoles = [self objectOrNilForKey:kRideSeekerUserRoles fromDictionary:dict];
            self.username = [self objectOrNilForKey:kRideSeekerUsername fromDictionary:dict];
            self.version = [[self objectOrNilForKey:kRideSeekerVersion fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kRideSeekerEmail fromDictionary:dict];
            self.ownedVehicles = [self objectOrNilForKey:kRideSeekerOwnedVehicles fromDictionary:dict];
            self.lastName = [self objectOrNilForKey:kRideSeekerLastName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kRideSeekerPhone];
    [mutableDict setValue:self.firstName forKey:kRideSeekerFirstName];
    [mutableDict setValue:self.createdDatetime forKey:kRideSeekerCreatedDatetime];
    [mutableDict setValue:self.rideSeekerIdentifier forKey:kRideSeekerId];
    [mutableDict setValue:self.centerId forKey:kRideSeekerCenterId];
    NSMutableArray *tempArrayForUserRoles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.userRoles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUserRoles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUserRoles addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserRoles] forKey:kRideSeekerUserRoles];
    [mutableDict setValue:self.username forKey:kRideSeekerUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kRideSeekerVersion];
    [mutableDict setValue:self.email forKey:kRideSeekerEmail];
    
    NSMutableArray *tempArrayForOwnedVehicles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ownedVehicles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOwnedVehicles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOwnedVehicles addObject:subArrayObject];
        }
    }
    //[mutableDict setValue:self.ownedVehicles forKey:kRideSeekerOwnedVehicles];
    [mutableDict setValue:self.lastName forKey:kRideSeekerLastName];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.phone = [aDecoder decodeObjectForKey:kRideSeekerPhone];
    self.firstName = [aDecoder decodeObjectForKey:kRideSeekerFirstName];
    self.createdDatetime = [aDecoder decodeObjectForKey:kRideSeekerCreatedDatetime];
    self.rideSeekerIdentifier = [aDecoder decodeObjectForKey:kRideSeekerId];
    self.centerId = [aDecoder decodeObjectForKey:kRideSeekerCenterId];
    self.userRoles = [aDecoder decodeObjectForKey:kRideSeekerUserRoles];
    self.username = [aDecoder decodeObjectForKey:kRideSeekerUsername];
    self.version = [aDecoder decodeDoubleForKey:kRideSeekerVersion];
    self.email = [aDecoder decodeObjectForKey:kRideSeekerEmail];
    self.ownedVehicles = [aDecoder decodeObjectForKey:kRideSeekerOwnedVehicles];
    self.lastName = [aDecoder decodeObjectForKey:kRideSeekerLastName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kRideSeekerPhone];
    [aCoder encodeObject:_firstName forKey:kRideSeekerFirstName];
    [aCoder encodeObject:_createdDatetime forKey:kRideSeekerCreatedDatetime];
    [aCoder encodeObject:_rideSeekerIdentifier forKey:kRideSeekerId];
    [aCoder encodeObject:_centerId forKey:kRideSeekerCenterId];
    [aCoder encodeObject:_userRoles forKey:kRideSeekerUserRoles];
    [aCoder encodeObject:_username forKey:kRideSeekerUsername];
    [aCoder encodeDouble:_version forKey:kRideSeekerVersion];
    [aCoder encodeObject:_email forKey:kRideSeekerEmail];
    [aCoder encodeObject:_ownedVehicles forKey:kRideSeekerOwnedVehicles];
    [aCoder encodeObject:_lastName forKey:kRideSeekerLastName];
}

- (id)copyWithZone:(NSZone *)zone
{
    RideSeeker *copy = [[RideSeeker alloc] init];
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.createdDatetime = [self.createdDatetime copyWithZone:zone];
        copy.rideSeekerIdentifier = [self.rideSeekerIdentifier copyWithZone:zone];
        copy.centerId = [self.centerId copyWithZone:zone];
        copy.userRoles = [self.userRoles copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.version = self.version;
        copy.email = [self.email copyWithZone:zone];
        copy.ownedVehicles = [self.ownedVehicles copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
    }
    
    return copy;
}


@end
