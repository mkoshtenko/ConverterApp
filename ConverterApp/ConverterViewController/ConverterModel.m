//
//  ConverterModel.m
//  ConverterApp
//
//  Created by maxim.k on 6/9/14.
//  All rights reserved.
//

#import "ConverterModel_Internal.h"
#import "MathMilesToKm.h"
#import "MathLitersToGal.h"
#import "MathInchesToCm.h"
#import "MathCelsiusToK.h"

NSString *const kConverterModelDidUpdateNotification = @"ConverterModelDidUpdateNotification";

@implementation ConverterModel

- (id)init
{
    self = [super init];
    if(self)
    {
        _mathModelList = [self listOfDefaultMathModels];
    }
    return self;
}

- (NSArray *)listOfDefaultMathModels
{
    return @[[MathMilesToKm new], [MathLitersToGal new], [MathInchesToCm new], [MathCelsiusToK new]];
}

- (id<MathProtocol>)currentMathModel
{
    return _mathModelList[_selectedMathModel];
}

- (NSNumber *)convertedValueWithMathModel:(id<MathProtocol>)math
{
    return [math convertNumber:_value];
}

- (void)convertValue
{
    [self updateWithText:[[self convertedValueWithMathModel:[self currentMathModel]] stringValue]];
}

- (void)updateWithText:(NSString *)text
{
    if(!_numberFormatter)
    {
        _numberFormatter = [NSNumberFormatter new];
        [_numberFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
        [_numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
    }
    
    if([text length] > 0 && [text hasSuffix:@"."])
    {
        _text = text;
    }
    else
    {
        _value = [_numberFormatter numberFromString:text];
        _text = [_value stringValue];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kConverterModelDidUpdateNotification object:self];
}

@end
