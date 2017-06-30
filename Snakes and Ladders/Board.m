//
//  Board.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Board.h"

@implementation Board

- (instancetype)init
{
    self = [self initWithSnakes:20 andLadders:25];
    return self;
}

- (instancetype)initWithSnakes:(NSInteger)snakes andLadders:(NSInteger)ladders
{
    self = [super init];
    if (self) {
        _numberOfSnakes = snakes;
        _numberOfLadders = ladders;
    }
    return self;
}

- (void) regenerateBoard{
    
}

@end
