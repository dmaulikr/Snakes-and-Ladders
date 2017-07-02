//
//  PlayerManager.h
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;
@class Board;
@interface PlayerManager : NSObject

@property (nonatomic, strong) NSMutableArray* players;
@property (nonatomic, assign) NSUInteger currentIndex;

- (void) createPlayers:(NSInteger)numberOfPlayers;
- (Player*) currentPlayer;
- (void) playerTurn;
- (void) leaveGame;
- (void) roll:(Board*)board;
- (void) output;
- (BOOL) score;

@end
