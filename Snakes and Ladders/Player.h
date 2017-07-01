//
//  Player.h
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"


@interface Player : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) NSInteger currentSquare;
@property (nonatomic, assign) BOOL gameOver;

- (void) roll:(NSDictionary*)board;
- (void) output:(NSDictionary*)board rolled:(int)dice;

@end
