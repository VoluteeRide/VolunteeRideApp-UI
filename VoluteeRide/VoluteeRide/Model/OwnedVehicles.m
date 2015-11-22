//
//  OwnedVehicles.m
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import "OwnedVehicles.h"


NSString *const kOwnedVehiclesTotalRiderCapacity = @"totalRiderCapacity";
NSString *const kOwnedVehiclesModel = @"model";
NSString *const kOwnedVehiclesType = @"type";
NSString *const kOwnedVehiclesMake = @"make";
NSString *const kOwnedVehiclesColor = @"color";


@interface OwnedVehicles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation OwnedVehicles

@synthesize totalRiderCapacity = _totalRiderCapacity;
@synthesize model = _model;
@synthesize type = _type;
@synthesize make = _make;
@synthesize color = _color;


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
            self.totalRiderCapacity = [[self objectOrNilForKey:kOwnedVehiclesTotalRiderCapacity fromDictionary:dict] doubleValue];
            self.model = [self objectOrNilForKey:kOwnedVehiclesModel fromDictionary:dict];
            self.type = [self objectOrNilForKey:kOwnedVehiclesType fromDictionary:dict];
            self.make = [self objectOrNilForKey:kOwnedVehiclesMake fromDictionary:dict];
            self.color = [self objectOrNilForKey:kOwnedVehiclesColor fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.totalRiderCapacity] forKey:kOwnedVehiclesTotalRiderCapacity];
    [mutableDict setValue:self.model forKey:kOwnedVehiclesModel];
    [mutableDict setValue:self.type forKey:kOwnedVehiclesType];
    [mutableDict setValue:self.make forKey:kOwnedVehiclesMake];
    [mutableDict setValue:self.color forKey:kOwnedVehiclesColor];

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

    self.totalRiderCapacity = [aDecoder decodeDoubleForKey:kOwnedVehiclesTotalRiderCapacity];
    self.model = [aDecoder decodeObjectForKey:kOwnedVehiclesModel];
    self.type = [aDecoder decodeObjectForKey:kOwnedVehiclesType];
    self.make = [aDecoder decodeObjectForKey:kOwnedVehiclesMake];
    self.color = [aDecoder decodeObjectForKey:kOwnedVehiclesColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_totalRiderCapacity forKey:kOwnedVehiclesTotalRiderCapacity];
    [aCoder encodeObject:_model forKey:kOwnedVehiclesModel];
    [aCoder encodeObject:_type forKey:kOwnedVehiclesType];
    [aCoder encodeObject:_make forKey:kOwnedVehiclesMake];
    [aCoder encodeObject:_color forKey:kOwnedVehiclesColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    OwnedVehicles *copy = [[OwnedVehicles alloc] init];
    
    if (copy) {

        copy.totalRiderCapacity = self.totalRiderCapacity;
        copy.model = [self.model copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.make = [self.make copyWithZone:zone];
        copy.color = [self.color copyWithZone:zone];
    }
    
    return copy;
}


@end
