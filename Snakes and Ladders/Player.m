//
//  Player.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
    }
    return self;
}

- (void) roll {
    int dice = arc4random_uniform(6) + 1;
    self.currentSquare+= dice;
    NSLog(@"\nYou have rolled %i", dice);
}

@end
