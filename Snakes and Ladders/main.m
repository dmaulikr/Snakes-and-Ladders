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
       
        //Randomises board with 10 snakes and 15 ladders
        Board *board = [[Board alloc] init];
        //Manages Player Turn and Player Movements
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
            // Creates number of players based on a non-zero digit input up to 8
            [playerManager createPlayers:numberOfPlayers];
            
            NSLog(@"\nWelcome to Snakes & Ladders\n");
            NSLog(@"\nGame Commands:\n"
                  "roll - Roll dice\n"
                  "leave - You leave but game continues\n"
                  "reset - Resets the game\n"
                  "quit - Ends the game");
            BOOL playGame = YES;
            do {
                //Display current player's turn
                [playerManager playerTurn];
                //Obtain input for player commands
                NSString* inputString = [InputHandler obtainInputLowercase];
                if ([inputString isEqualToString:@"roll"] || [inputString isEqualToString:@"r"]){
                    //PlayerManager calls roll method on current player
                    //Player roll method will check board for snakes/ladders
                    [playerManager roll:board];
                    //Outputs score and returns YES if someone has won the game
                    resetGame = [playerManager score];
                }
                //Allows a player to leave the game while rest of players continue
                if ([inputString isEqualToString:@"leave"]){
                    [playerManager leaveGame];
                    [playerManager score];
                }
                //Reset the game, allow for number of Player input.
                if ([inputString isEqualToString:@"reset"] || resetGame){
                    //Remove all players
                    [playerManager.players removeAllObjects];
                    //Board will the re-randomized
                    [board generateBoard];
                    playGame = NO; //Break while loop
                    NSLog(@"Game is being reset.");
                    continue;
                }
                //Exits the game
                if ([inputString isEqualToString:@"quit"]){
                    //Prompt if user would prefer to reset instead
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
