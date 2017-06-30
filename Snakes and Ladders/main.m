//
//  main.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        NSLog(@"Welcome to Snakes & Ladders\n");
        NSLog(@"Game Commands:\n"
              "roll - Roll dice\n");
        BOOL playGame = YES;
        do {
            NSString* inputString = [InputHandler obtainInput];
            
            if ([inputString isEqualToString:"quit"]){
                NSLog(@"Game has ended");
                playGame = NO;
            }
            
        }while(playGame);
    
    }
    return 0;
}
