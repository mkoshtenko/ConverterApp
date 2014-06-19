//
//  MathBase.m
//  ConverterApp
//
//  Created by maxim.k on 6/14/14.
//  All rights reserved.
//

#import "MathBase.h"

@implementation MathBase

- (id)init
{
    self = [super init];
    if(self)
    {
        _defaultDirection = YES;
    }
    return self;
}

- (NSString *)description
{
    id<MathProtocol> inst = (id)self;
    NSString* from = (_defaultDirection?inst.defaultFrom:inst.defaultTo);
    NSString* to = (_defaultDirection?inst.defaultTo:inst.defaultFrom);
    
    return [NSString stringWithFormat:@"%@ to %@", from, to];
}

@end
