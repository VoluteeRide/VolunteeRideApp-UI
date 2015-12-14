//
//  PickUpLocations.h
//
//  Created by Karim Abdul on 12/13/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface PickUpLocations : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *streetAddress;
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) double houseNumber;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *city;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
