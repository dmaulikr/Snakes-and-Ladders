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
#import "Board.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Board *board = [[Board alloc] init];
        Player *player1 = [[Player alloc] init];
        
        NSLog(@"\nWelcome to Snakes & Ladders\n");
        NSLog(@"\nGame Commands:\n"
              "roll - Roll dice\n");
        BOOL playGame = YES;
        do {
//            NSString* inputString = [InputHandler obtainInput];
            NSString* inputString = @"roll";
            sleep(0.5);
            if ([inputString isEqualToString:@"roll"]){
                [player1 roll:board.boardLayout];
            }
            if ([inputString isEqualToString:@"reset"]){
                [board generateBoard];
            }
            if ([inputString isEqualToString:@"quit"] || player1.currentSquare >= 100){
                NSLog(@"\nGame has ended");
                playGame = NO;
            }
            
        }while(playGame);
    
    }
    return 0;
}
