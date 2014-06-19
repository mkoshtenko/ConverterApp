//
//  MathInchesToCm.m
//  ConverterApp
//
//  Created by maxim.k on 6/17/14.
//  All rights reserved.
//

#import "MathInchesToCm.h"

static float const kInchesMult = 2.54;

@implementation MathInchesToCm

- (NSNumber *)convertNumber:(NSNumber *)number
{
    float oldValue = [number floatValue];
    
    if(self.defaultDirection)
        return @(oldValue * kInchesMult);
    else
        return @(oldValue / kInchesMult);
}

- (NSString *)defaultFrom
{
    return @"Inches";
}

- (NSString *)defaultTo
{
    return @"Centimeters";
}

@end
