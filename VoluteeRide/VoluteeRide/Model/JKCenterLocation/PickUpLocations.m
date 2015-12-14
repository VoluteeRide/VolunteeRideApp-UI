//
//  PickUpLocations.m
//
//  Created by Karim Abdul on 12/13/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "PickUpLocations.h"


NSString *const kPickUpLocationsStreetAddress = @"streetAddress";
NSString *const kPickUpLocationsLocationName = @"locationName";
NSString *const kPickUpLocationsState = @"state";
NSString *const kPickUpLocationsHouseNumber = @"houseNumber";
NSString *const kPickUpLocationsZipcode = @"zipcode";
NSString *const kPickUpLocationsCity = @"city";


@interface PickUpLocations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PickUpLocations

@synthesize streetAddress = _streetAddress;
@synthesize locationName = _locationName;
@synthesize state = _state;
@synthesize houseNumber = _houseNumber;
@synthesize zipcode = _zipcode;
@synthesize city = _city;


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
            self.streetAddress = [self objectOrNilForKey:kPickUpLocationsStreetAddress fromDictionary:dict];
            self.locationName = [self objectOrNilForKey:kPickUpLocationsLocationName fromDictionary:dict];
            self.state = [self objectOrNilForKey:kPickUpLocationsState fromDictionary:dict];
            self.houseNumber = [[self objectOrNilForKey:kPickUpLocationsHouseNumber fromDictionary:dict] doubleValue];
            self.zipcode = [self objectOrNilForKey:kPickUpLocationsZipcode fromDictionary:dict];
            self.city = [self objectOrNilForKey:kPickUpLocationsCity fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.streetAddress forKey:kPickUpLocationsStreetAddress];
    [mutableDict setValue:self.locationName forKey:kPickUpLocationsLocationName];
    [mutableDict setValue:self.state forKey:kPickUpLocationsState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.houseNumber] forKey:kPickUpLocationsHouseNumber];
    [mutableDict setValue:self.zipcode forKey:kPickUpLocationsZipcode];
    [mutableDict setValue:self.city forKey:kPickUpLocationsCity];

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

    self.streetAddress = [aDecoder decodeObjectForKey:kPickUpLocationsStreetAddress];
    self.locationName = [aDecoder decodeObjectForKey:kPickUpLocationsLocationName];
    self.state = [aDecoder decodeObjectForKey:kPickUpLocationsState];
    self.houseNumber = [aDecoder decodeDoubleForKey:kPickUpLocationsHouseNumber];
    self.zipcode = [aDecoder decodeObjectForKey:kPickUpLocationsZipcode];
    self.city = [aDecoder decodeObjectForKey:kPickUpLocationsCity];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_streetAddress forKey:kPickUpLocationsStreetAddress];
    [aCoder encodeObject:_locationName forKey:kPickUpLocationsLocationName];
    [aCoder encodeObject:_state forKey:kPickUpLocationsState];
    [aCoder encodeDouble:_houseNumber forKey:kPickUpLocationsHouseNumber];
    [aCoder encodeObject:_zipcode forKey:kPickUpLocationsZipcode];
    [aCoder encodeObject:_city forKey:kPickUpLocationsCity];
}

- (id)copyWithZone:(NSZone *)zone
{
    PickUpLocations *copy = [[PickUpLocations alloc] init];
    
    if (copy) {

        copy.streetAddress = [self.streetAddress copyWithZone:zone];
        copy.locationName = [self.locationName copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
        copy.houseNumber = self.houseNumber;
        copy.zipcode = [self.zipcode copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
    }
    
    return copy;
}


@end
