//
//  PlayerManager.h
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PlayerManager : NSObject

@property (nonatomic, strong) NSMutableArray* players;

- (void) createPlayers:(NSInteger)numberOfPlayers;

@end
