//
//  Location.m
//
//  Created by Karim Abdul on 12/13/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "Location.h"


NSString *const kLocationStreetAddress = @"streetAddress";
NSString *const kLocationLocationName = @"locationName";
NSString *const kLocationState = @"state";
NSString *const kLocationHouseNumber = @"houseNumber";
NSString *const kLocationZipcode = @"zipcode";
NSString *const kLocationCity = @"city";


@interface Location ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Location

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
            self.streetAddress = [self objectOrNilForKey:kLocationStreetAddress fromDictionary:dict];
            self.locationName = [self objectOrNilForKey:kLocationLocationName fromDictionary:dict];
            self.state = [self objectOrNilForKey:kLocationState fromDictionary:dict];
            self.houseNumber = [[self objectOrNilForKey:kLocationHouseNumber fromDictionary:dict] doubleValue];
            self.zipcode = [self objectOrNilForKey:kLocationZipcode fromDictionary:dict];
            self.city = [self objectOrNilForKey:kLocationCity fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.streetAddress forKey:kLocationStreetAddress];
    [mutableDict setValue:self.locationName forKey:kLocationLocationName];
    [mutableDict setValue:self.state forKey:kLocationState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.houseNumber] forKey:kLocationHouseNumber];
    [mutableDict setValue:self.zipcode forKey:kLocationZipcode];
    [mutableDict setValue:self.city forKey:kLocationCity];

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

    self.streetAddress = [aDecoder decodeObjectForKey:kLocationStreetAddress];
    self.locationName = [aDecoder decodeObjectForKey:kLocationLocationName];
    self.state = [aDecoder decodeObjectForKey:kLocationState];
    self.houseNumber = [aDecoder decodeDoubleForKey:kLocationHouseNumber];
    self.zipcode = [aDecoder decodeObjectForKey:kLocationZipcode];
    self.city = [aDecoder decodeObjectForKey:kLocationCity];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_streetAddress forKey:kLocationStreetAddress];
    [aCoder encodeObject:_locationName forKey:kLocationLocationName];
    [aCoder encodeObject:_state forKey:kLocationState];
    [aCoder encodeDouble:_houseNumber forKey:kLocationHouseNumber];
    [aCoder encodeObject:_zipcode forKey:kLocationZipcode];
    [aCoder encodeObject:_city forKey:kLocationCity];
}

- (id)copyWithZone:(NSZone *)zone
{
    Location *copy = [[Location alloc] init];
    
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
