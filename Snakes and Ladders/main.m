//
//  main.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"
#import "Board.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Board *board = [[Board alloc] init];
        PlayerManager *playerManager = [[PlayerManager alloc] init];
        
        BOOL resetGame = NO;
        do {
            NSLog(@"Please input number of players(Max 8):");
            NSInteger numberOfPlayers = [InputHandler obtainNumberInput];
            do {
                if (!numberOfPlayers) {
                    NSLog(@"Unable to play without players.");
                    NSLog(@"Please input number of players(Max 8):");
                    numberOfPlayers = [InputHandler obtainNumberInput];
                }
            }while(!numberOfPlayers);
            [playerManager createPlayers:numberOfPlayers];
            
            //        NSLog(@"%@", playerManager.players);
            NSLog(@"\nWelcome to Snakes & Ladders\n");
            NSLog(@"\nGame Commands:\n"
                  "roll - Roll dice\n"
                  "leave - You leave but game continues\n"
                  "reset - Resets the game\n"
                  "quit - Ends the game");
            BOOL playGame = YES;
            do {
                [playerManager playerTurn];
                NSString* inputString = [InputHandler obtainInputLowercase];
                if ([inputString isEqualToString:@"roll"] || [inputString isEqualToString:@"r"]){
                    [playerManager roll:board];
                    resetGame = [playerManager score];
                    //                [player1 roll:board.boardLayout];
                }
                if ([inputString isEqualToString:@"leave"]){
                    [playerManager leaveGame];
                }
                if ([inputString isEqualToString:@"reset"] || resetGame){
                    [playerManager.players removeAllObjects];
                    [board generateBoard];
                    playGame = NO;
                    NSLog(@"Game is being reset.");
                    continue;
                }
                if ([inputString isEqualToString:@"quit"]){
                    NSLog(@"Would you like to ""reset"" or ""quit""?");
                    inputString = [InputHandler obtainInputLowercase];
                    if ([inputString isEqualToString:@"reset"]){
                        [playerManager.players removeAllObjects];
                        [board generateBoard];
                        playGame = NO; resetGame = YES;
                    } else if ([inputString isEqualToString:@"quit"]){
                        NSLog(@"\nGame has ended.");
                        NSLog(@"\nThanks for playing.");
                        playGame = NO;
                    }
                }
                
            }while(playGame);
        }while(resetGame);
    }
    return 0;
}
