//
//  main.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Player *player1 = [[Player alloc] init];
        
        NSLog(@"\nWelcome to Snakes & Ladders\n");
        NSLog(@"\nGame Commands:\n"
              "roll - Roll dice\n");
        BOOL playGame = YES;
        do {
            NSString* inputString = [InputHandler obtainInput];
            
            if ([inputString isEqualToString:@"roll"]){
                [player1 roll];
            }
            if ([inputString isEqualToString:@"quit"]){
                NSLog(@"\nGame has ended");
                playGame = NO;
            }
            
        }while(playGame);
    
    }
    return 0;
}
