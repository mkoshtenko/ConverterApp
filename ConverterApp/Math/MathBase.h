//
//  MathBase.h
//  ConverterApp
//
//  Created by maxim.k on 6/14/14.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathBase : NSObject

@property (nonatomic, assign) BOOL defaultDirection;

@end


@protocol MathProtocol <NSObject>
@required
- (NSString *)defaultFrom;
- (NSString *)defaultTo;

- (NSNumber *)convertNumber:(NSNumber *)number;

@end
