//
//  PlayerManager.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager

- (void) createPlayers:(NSInteger)numberOfPlayers{
    for (int i = 0; i < numberOfPlayers; i++){
        switch (i) {
            case 0:{
                Player *player1 = [[Player alloc] init];
                [self.players addObject:player1];
                break;
            }
            case 1:{
                Player *player2 = [[Player alloc] init];
                [self.players addObject:player2];
                break;
            }
            case 2:{
                Player *player3 = [[Player alloc] init];
                [self.players addObject:player3];
                break;
            }
            case 3:{
                Player *player4 = [[Player alloc] init];
                [self.players addObject:player4];
                break;
            }
            case 4:{
                Player *player5 = [[Player alloc] init];
                [self.players addObject:player5];
                break;
            }
            case 5:{
                Player *player6 = [[Player alloc] init];
                [self.players addObject:player6];
                break;
            }
            case 6:{
                Player *player7 = [[Player alloc] init];
                [self.players addObject:player7];
                break;
            }
            case 7:{
                Player *player8 = [[Player alloc] init];
                [self.players addObject:player8];
                break;
            }
            default:
                break;
        }
    }
}

//Lazy Initialization
- (NSMutableArray*) players {
    
    if (!_players){
        _players = [[NSMutableArray alloc] init];
    }
    return _players;
}

@end
