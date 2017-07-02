//
//  PlayerManager.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "PlayerManager.h"
#import "Player.h"

@implementation PlayerManager

- (void) createPlayers:(NSInteger)numberOfPlayers{
    for (int i = 0; i < numberOfPlayers; i++){
        switch (i) {
            case 0:{
                Player *player1 = [[Player alloc] init];
                player1.name = @"player1";
                [self.players addObject:player1];
                break;
            }
            case 1:{
                Player *player2 = [[Player alloc] init];
                player2.name = @"player2";
                [self.players addObject:player2];
                break;
            }
            case 2:{
                Player *player3 = [[Player alloc] init];
                player3.name = @"player3";
                [self.players addObject:player3];
                break;
            }
            case 3:{
                Player *player4 = [[Player alloc] init];
                player4.name = @"player4";
                [self.players addObject:player4];
                break;
            }
            case 4:{
                Player *player5 = [[Player alloc] init];
                player5.name = @"player5";
                [self.players addObject:player5];
                break;
            }
            case 5:{
                Player *player6 = [[Player alloc] init];
                player6.name = @"player6";
                [self.players addObject:player6];
                break;
            }
            case 6:{
                Player *player7 = [[Player alloc] init];
                player7.name = @"player7";
                [self.players addObject:player7];
                break;
            }
            case 7:{
                Player *player8 = [[Player alloc] init];
                player8.name = @"player8";
                [self.players addObject:player8];
                break;
            }
            default:
                break;
        }
    }
}

- (Player*) currentPlayer{
    NSUInteger playerTurn = self.currentIndex % self.players.count;
    //Game feature to continue playing after someone won
    while([self.players[playerTurn] leftGame]){
        self.currentIndex += 1;
        playerTurn = self.currentIndex % self.players.count;
    }
//    NSLog(@"%@'s Turn.", [self.players[playerTurn] name]);
    return self.players[playerTurn];
}

- (void) playerTurn{
    NSLog(@"%@'s turn.", [[self currentPlayer] name]);
}

- (void) leaveGame{
    Player *currentPlayer = [self currentPlayer];
    [currentPlayer setLeftGame:YES];
//    self.currentIndex += 1;
}

- (void) roll:(Board*)board{
//    [player roll]
    Player *currentPlayer = [self currentPlayer];
    [currentPlayer roll:board.boardLayout];
    [self output];
}

- (void) output{
    Player *currentPlayer = [self currentPlayer];
    [currentPlayer output];
    self.currentIndex += 1;
}

- (BOOL) score{
    NSMutableString *allScores = [[NSMutableString alloc] initWithString:@"score: "];
    BOOL resetGame = NO;
    for (int i =0; i < self.players.count; i++){
        Player *currentPlayer = self.players[i];
        [allScores appendString:[NSString stringWithFormat:@"%@: %li ", currentPlayer.name, currentPlayer.currentSquare]];
        if (currentPlayer.gameOver){
            resetGame = YES;
        }
    }
    NSLog(@"%@", allScores);
    return resetGame;
}


//Lazy Initialization
- (NSMutableArray*) players {
    
    if (!_players){
        _currentIndex = 0;
        _players = [[NSMutableArray alloc] init];
    }
    return _players;
}

@end
