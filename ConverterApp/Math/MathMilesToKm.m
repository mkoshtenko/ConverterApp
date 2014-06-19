//
//  MathMilesToKm.m
//  ConverterApp
//
//  Created by maxim.k on 6/16/14.
//  All rights reserved.
//

#import "MathMilesToKm.h"

static float const kMilesMult = 1.609344;

@implementation MathMilesToKm

- (NSNumber *)convertNumber:(NSNumber *)number
{
    float oldValue = [number floatValue];
    
    if(self.defaultDirection)
        return @(oldValue * kMilesMult);
    else
        return @(oldValue / kMilesMult);
}

- (NSString *)defaultFrom
{
    return @"Miles";
}

- (NSString *)defaultTo
{
    return @"Kilometers";
}

@end
