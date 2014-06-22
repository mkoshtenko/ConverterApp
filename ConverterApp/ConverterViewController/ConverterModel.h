//
//  ConverterModel.h
//  ConverterApp
//
//  Created by maxim.k on 6/9/14.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MathBase.h"

extern NSString *const kConverterModelDidUpdateNotification;

@interface ConverterModel : NSObject
{
    NSNumberFormatter*      _numberFormatter;
    
    NSNumber*   _value;
}

@property (nonatomic, strong) NSString* text;

@property (nonatomic, strong) NSArray* mathModelList;
@property (nonatomic, assign) NSUInteger selectedMathModel;

- (void)updateWithText:(NSString *)text;

- (void)convertValue;

- (id<MathProtocol>)currentMathModel;
- (NSNumber *)convertedValueWithMathModel:(id<MathProtocol>)math;

@end
