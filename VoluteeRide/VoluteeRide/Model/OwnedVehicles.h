//
//  OwnedVehicles.h
//
//  Created by Karim Abdul on 11/22/15
//  Copyright (c) 2015 George Washington University. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface OwnedVehicles : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double totalRiderCapacity;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *make;
@property (nonatomic, strong) NSString *color;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
