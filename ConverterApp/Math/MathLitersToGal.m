//
//  MathLitersToGal.m
//  ConverterApp
//
//  Created by maxim.k on 6/17/14.
//  All rights reserved.
//

#import "MathLitersToGal.h"

static float const kLiterMult = 0.264172052;

@implementation MathLitersToGal

- (NSNumber *)convertNumber:(NSNumber *)number
{
    float oldValue = [number floatValue];
    
    if(self.defaultDirection)
        return @(oldValue * kLiterMult);
    else
        return @(oldValue / kLiterMult);
}

- (NSString *)defaultFrom
{
    return @"Liters";
}

- (NSString *)defaultTo
{
    return @"Gallons";
}

@end
