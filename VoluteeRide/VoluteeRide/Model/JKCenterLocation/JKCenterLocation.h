//
//  JKCenterLocation.h
//
//  Created by Karim Abdul on 12/13/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Location;

@interface JKCenterLocation : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *centerLocationIdentifier;
@property (nonatomic, strong) NSString *createdDatetime;
@property (nonatomic, strong) NSArray *pickUpLocations;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Location *location;
@property (nonatomic, assign) double version;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
