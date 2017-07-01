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
        _gameOver = NO;
    }
    return self;
}

- (void) roll:(NSDictionary*)board {
    int dice = arc4random_uniform(6) + 1;
    NSLog(@"\nYou have rolled %i", dice);
    [self output:board rolled:dice];
}

- (void)output:(NSDictionary *)board rolled:(int)dice{

    NSInteger newSquare = self.currentSquare + dice;
    if ([board objectForKey:@(newSquare)]){
        if (self.currentSquare < [board[@(newSquare)] integerValue]){
            NSLog(@"Stairway to heaven!");
        } else {
            NSLog(@"You got snaked!");
        }
        self.currentSquare = [board[@(newSquare)] integerValue];
    } else {
        self.currentSquare+= dice;
    }
    if (self.currentSquare >= 100){
        NSLog(@"Congratulations!\nYou reached the end of the game!");
    } else {
        NSLog(@"You are now at %li", self.currentSquare);
    }
}

@end
