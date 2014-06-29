//
//  MathCelsiusToK.m
//  ConverterApp
//
//  Created by maxim.k on 6/17/14.
//  All rights reserved.
//

#import "MathCelsiusToK.h"

//TODO: Need to review this constant, seems should be 273.15
static float const kCelsiusAdd = 274.15;


@implementation MathCelsiusToK

- (NSNumber *)convertNumber:(NSNumber *)number
{
    float oldValue = [number floatValue];
    
    if(self.defaultDirection)
        return @(oldValue + kCelsiusAdd);
    else
        return @(oldValue - kCelsiusAdd);
}

- (NSString *)defaultFrom
{
    return @"Celsius";
}

- (NSString *)defaultTo
{
    return @"Kelvins";
}

@end
