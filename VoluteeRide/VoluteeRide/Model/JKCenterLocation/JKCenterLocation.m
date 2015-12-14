//
//  JKCenterLocation.m
//
//  Created by Karim Abdul on 12/13/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "JKCenterLocation.h"
#import "PickUpLocations.h"
#import "Location.h"


NSString *const kJKCenterLocationId = @"id";
NSString *const kJKCenterLocationCreatedDatetime = @"createdDatetime";
NSString *const kJKCenterLocationPickUpLocations = @"pickUpLocations";
NSString *const kJKCenterLocationName = @"name";
NSString *const kJKCenterLocationLocation = @"location";
NSString *const kJKCenterLocationVersion = @"version";


@interface JKCenterLocation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation JKCenterLocation

@synthesize centerLocationIdentifier = _centerLocationIdentifier;
@synthesize createdDatetime = _createdDatetime;
@synthesize pickUpLocations = _pickUpLocations;
@synthesize name = _name;
@synthesize location = _location;
@synthesize version = _version;


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
            self.centerLocationIdentifier = [self objectOrNilForKey:kJKCenterLocationId fromDictionary:dict];
            self.createdDatetime = [self objectOrNilForKey:kJKCenterLocationCreatedDatetime fromDictionary:dict];
    NSObject *receivedPickUpLocations = [dict objectForKey:kJKCenterLocationPickUpLocations];
    NSMutableArray *parsedPickUpLocations = [NSMutableArray array];
    if ([receivedPickUpLocations isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPickUpLocations) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPickUpLocations addObject:[PickUpLocations modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPickUpLocations isKindOfClass:[NSDictionary class]]) {
       [parsedPickUpLocations addObject:[PickUpLocations modelObjectWithDictionary:(NSDictionary *)receivedPickUpLocations]];
    }

    self.pickUpLocations = [NSArray arrayWithArray:parsedPickUpLocations];
            self.name = [self objectOrNilForKey:kJKCenterLocationName fromDictionary:dict];
            self.location = [Location modelObjectWithDictionary:[dict objectForKey:kJKCenterLocationLocation]];
            self.version = [[self objectOrNilForKey:kJKCenterLocationVersion fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.centerLocationIdentifier forKey:kJKCenterLocationId];
    [mutableDict setValue:self.createdDatetime forKey:kJKCenterLocationCreatedDatetime];
    NSMutableArray *tempArrayForPickUpLocations = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pickUpLocations) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPickUpLocations addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPickUpLocations addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPickUpLocations] forKey:kJKCenterLocationPickUpLocations];
    [mutableDict setValue:self.name forKey:kJKCenterLocationName];
    [mutableDict setValue:[self.location dictionaryRepresentation] forKey:kJKCenterLocationLocation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kJKCenterLocationVersion];

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

    self.centerLocationIdentifier = [aDecoder decodeObjectForKey:kJKCenterLocationId];
    self.createdDatetime = [aDecoder decodeObjectForKey:kJKCenterLocationCreatedDatetime];
    self.pickUpLocations = [aDecoder decodeObjectForKey:kJKCenterLocationPickUpLocations];
    self.name = [aDecoder decodeObjectForKey:kJKCenterLocationName];
    self.location = [aDecoder decodeObjectForKey:kJKCenterLocationLocation];
    self.version = [aDecoder decodeDoubleForKey:kJKCenterLocationVersion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_centerLocationIdentifier forKey:kJKCenterLocationId];
    [aCoder encodeObject:_createdDatetime forKey:kJKCenterLocationCreatedDatetime];
    [aCoder encodeObject:_pickUpLocations forKey:kJKCenterLocationPickUpLocations];
    [aCoder encodeObject:_name forKey:kJKCenterLocationName];
    [aCoder encodeObject:_location forKey:kJKCenterLocationLocation];
    [aCoder encodeDouble:_version forKey:kJKCenterLocationVersion];
}

- (id)copyWithZone:(NSZone *)zone
{
    JKCenterLocation *copy = [[JKCenterLocation alloc] init];
    
    if (copy) {

        copy.centerLocationIdentifier = [self.centerLocationIdentifier copyWithZone:zone];
        copy.createdDatetime = [self.createdDatetime copyWithZone:zone];
        copy.pickUpLocations = [self.pickUpLocations copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.location = [self.location copyWithZone:zone];
        copy.version = self.version;
    }
    
    return copy;
}


@end
