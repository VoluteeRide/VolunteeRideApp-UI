//
//  Registration.m
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "Registration.h"
#import "OwnedVehicles.h"


NSString *const kRegistrationPhone = @"phone";
NSString *const kRegistrationPassword = @"password";
NSString *const kRegistrationFirstName = @"firstName";
NSString *const kRegistrationCenterId = @"centerId";
NSString *const kRegistrationUserRoles = @"userRoles";
NSString *const kRegistrationUsername = @"username";
NSString *const kRegistrationEmail = @"email";
NSString *const kRegistrationOwnedVehicles = @"ownedVehicles";
NSString *const kRegistrationLastName = @"lastName";


@interface Registration ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Registration

@synthesize phone = _phone;
@synthesize password = _password;
@synthesize firstName = _firstName;
@synthesize centerId = _centerId;
@synthesize userRoles = _userRoles;
@synthesize username = _username;
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
            self.phone = [self objectOrNilForKey:kRegistrationPhone fromDictionary:dict];
            self.password = [self objectOrNilForKey:kRegistrationPassword fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kRegistrationFirstName fromDictionary:dict];
            self.centerId = [self objectOrNilForKey:kRegistrationCenterId fromDictionary:dict];
            self.userRoles = [self objectOrNilForKey:kRegistrationUserRoles fromDictionary:dict];
            self.username = [self objectOrNilForKey:kRegistrationUsername fromDictionary:dict];
            self.email = [self objectOrNilForKey:kRegistrationEmail fromDictionary:dict];
    NSObject *receivedOwnedVehicles = [dict objectForKey:kRegistrationOwnedVehicles];
    NSMutableArray *parsedOwnedVehicles = [NSMutableArray array];
    if ([receivedOwnedVehicles isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedOwnedVehicles) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedOwnedVehicles addObject:[OwnedVehicles modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedOwnedVehicles isKindOfClass:[NSDictionary class]]) {
       [parsedOwnedVehicles addObject:[OwnedVehicles modelObjectWithDictionary:(NSDictionary *)receivedOwnedVehicles]];
    }

    self.ownedVehicles = [NSArray arrayWithArray:parsedOwnedVehicles];
            self.lastName = [self objectOrNilForKey:kRegistrationLastName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kRegistrationPhone];
    [mutableDict setValue:self.password forKey:kRegistrationPassword];
    [mutableDict setValue:self.firstName forKey:kRegistrationFirstName];
    [mutableDict setValue:self.centerId forKey:kRegistrationCenterId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserRoles] forKey:kRegistrationUserRoles];
    [mutableDict setValue:self.username forKey:kRegistrationUsername];
    [mutableDict setValue:self.email forKey:kRegistrationEmail];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOwnedVehicles] forKey:kRegistrationOwnedVehicles];
    [mutableDict setValue:self.lastName forKey:kRegistrationLastName];

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

    self.phone = [aDecoder decodeObjectForKey:kRegistrationPhone];
    self.password = [aDecoder decodeObjectForKey:kRegistrationPassword];
    self.firstName = [aDecoder decodeObjectForKey:kRegistrationFirstName];
    self.centerId = [aDecoder decodeObjectForKey:kRegistrationCenterId];
    self.userRoles = [aDecoder decodeObjectForKey:kRegistrationUserRoles];
    self.username = [aDecoder decodeObjectForKey:kRegistrationUsername];
    self.email = [aDecoder decodeObjectForKey:kRegistrationEmail];
    self.ownedVehicles = [aDecoder decodeObjectForKey:kRegistrationOwnedVehicles];
    self.lastName = [aDecoder decodeObjectForKey:kRegistrationLastName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kRegistrationPhone];
    [aCoder encodeObject:_password forKey:kRegistrationPassword];
    [aCoder encodeObject:_firstName forKey:kRegistrationFirstName];
    [aCoder encodeObject:_centerId forKey:kRegistrationCenterId];
    [aCoder encodeObject:_userRoles forKey:kRegistrationUserRoles];
    [aCoder encodeObject:_username forKey:kRegistrationUsername];
    [aCoder encodeObject:_email forKey:kRegistrationEmail];
    [aCoder encodeObject:_ownedVehicles forKey:kRegistrationOwnedVehicles];
    [aCoder encodeObject:_lastName forKey:kRegistrationLastName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Registration *copy = [[Registration alloc] init];
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.password = [self.password copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.centerId = [self.centerId copyWithZone:zone];
        copy.userRoles = [self.userRoles copyWithZone:zone];
        copy.username = [self.username copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.ownedVehicles = [self.ownedVehicles copyWithZone:zone];
        copy.lastName = [self.lastName copyWithZone:zone];
    }
    
    return copy;
}


@end
