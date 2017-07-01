//
//  InputHandler.m
//  Maths
//
//  Created by Errol Cheong on 2017-06-27.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        char inputChar[255];
        
        fgets(inputChar, 255, stdin);
        NSString *inputString = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
        NSCharacterSet *newLineChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        _cleanString = [inputString stringByTrimmingCharactersInSet:newLineChar];
    }
    return self;
}

+ (NSString *)obtainInput {
    char inputChar[255];
    
    fgets(inputChar, 255, stdin);
    NSString *inputString = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
    NSCharacterSet *newLineChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [inputString stringByTrimmingCharactersInSet:newLineChar];
}

+ (NSUInteger)obtainNumberInput {
    char inputChar[255];
    
    fgets(inputChar, 255, stdin);
    NSString *inputString = [NSString stringWithCString:inputChar encoding:NSUTF8StringEncoding];
    NSCharacterSet *newLineChar = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSCharacterSet *zeroChar = [NSCharacterSet characterSetWithCharactersInString:@"0"];
    inputString = [inputString stringByTrimmingCharactersInSet:newLineChar];
    NSUInteger inputNumber = [[inputString stringByTrimmingCharactersInSet:newLineChar] integerValue];
    
    if (inputNumber == 0){
        if ([[inputString stringByTrimmingCharactersInSet:zeroChar] isEqualToString:@""]){
            return 0;
        } else {
            NSLog(@"Input must be a number!");
            return 0;
        }
    } else {
        return inputNumber;
    }
}

@end
