//
//  Volunteer.m
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "Volunteer.h"
#import "OwnedVehicles.h"


NSString *const kVolunteerPhone = @"phone";
NSString *const kVolunteerFirstName = @"firstName";
NSString *const kVolunteerCreatedDatetime = @"createdDatetime";
NSString *const kVolunteerId = @"id";
NSString *const kVolunteerCenterId = @"centerId";
NSString *const kVolunteerUserRoles = @"userRoles";
NSString *const kVolunteerUsername = @"username";
NSString *const kVolunteerVersion = @"version";
NSString *const kVolunteerEmail = @"email";
NSString *const kVolunteerOwnedVehicles = @"ownedVehicles";
NSString *const kVolunteerLastName = @"lastName";


@interface Volunteer ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Volunteer

@synthesize phone = _phone;
@synthesize firstName = _firstName;
@synthesize createdDatetime = _createdDatetime;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
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
            self.phone = [self objectOrNilForKey:kVolunteerPhone fromDictionary:dict];
            self.firstName = [self objectOrNilForKey:kVolunteerFirstName fromDictionary:dict];
            self.createdDatetime = [self objectOrNilForKey:kVolunteerCreatedDatetime fromDictionary:dict];
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kVolunteerId fromDictionary:dict];
            self.centerId = [self objectOrNilForKey:kVolunteerCenterId fromDictionary:dict];
            self.userRoles = [self objectOrNilForKey:kVolunteerUserRoles fromDictionary:dict];
            self.username = [self objectOrNilForKey:kVolunteerUsername fromDictionary:dict];
            self.version = [[self objectOrNilForKey:kVolunteerVersion fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kVolunteerEmail fromDictionary:dict];
    NSObject *receivedOwnedVehicles = [dict objectForKey:kVolunteerOwnedVehicles];
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
            self.lastName = [self objectOrNilForKey:kVolunteerLastName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kVolunteerPhone];
    [mutableDict setValue:self.firstName forKey:kVolunteerFirstName];
    [mutableDict setValue:self.createdDatetime forKey:kVolunteerCreatedDatetime];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kVolunteerId];
    [mutableDict setValue:self.centerId forKey:kVolunteerCenterId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUserRoles] forKey:kVolunteerUserRoles];
    [mutableDict setValue:self.username forKey:kVolunteerUsername];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kVolunteerVersion];
    [mutableDict setValue:self.email forKey:kVolunteerEmail];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOwnedVehicles] forKey:kVolunteerOwnedVehicles];
    [mutableDict setValue:self.lastName forKey:kVolunteerLastName];

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

    self.phone = [aDecoder decodeObjectForKey:kVolunteerPhone];
    self.firstName = [aDecoder decodeObjectForKey:kVolunteerFirstName];
    self.createdDatetime = [aDecoder decodeObjectForKey:kVolunteerCreatedDatetime];
    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kVolunteerId];
    self.centerId = [aDecoder decodeObjectForKey:kVolunteerCenterId];
    self.userRoles = [aDecoder decodeObjectForKey:kVolunteerUserRoles];
    self.username = [aDecoder decodeObjectForKey:kVolunteerUsername];
    self.version = [aDecoder decodeDoubleForKey:kVolunteerVersion];
    self.email = [aDecoder decodeObjectForKey:kVolunteerEmail];
    self.ownedVehicles = [aDecoder decodeObjectForKey:kVolunteerOwnedVehicles];
    self.lastName = [aDecoder decodeObjectForKey:kVolunteerLastName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kVolunteerPhone];
    [aCoder encodeObject:_firstName forKey:kVolunteerFirstName];
    [aCoder encodeObject:_createdDatetime forKey:kVolunteerCreatedDatetime];
    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kVolunteerId];
    [aCoder encodeObject:_centerId forKey:kVolunteerCenterId];
    [aCoder encodeObject:_userRoles forKey:kVolunteerUserRoles];
    [aCoder encodeObject:_username forKey:kVolunteerUsername];
    [aCoder encodeDouble:_version forKey:kVolunteerVersion];
    [aCoder encodeObject:_email forKey:kVolunteerEmail];
    [aCoder encodeObject:_ownedVehicles forKey:kVolunteerOwnedVehicles];
    [aCoder encodeObject:_lastName forKey:kVolunteerLastName];
}

- (id)copyWithZone:(NSZone *)zone
{
    Volunteer *copy = [[Volunteer alloc] init];
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.firstName = [self.firstName copyWithZone:zone];
        copy.createdDatetime = [self.createdDatetime copyWithZone:zone];
        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
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
