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

- (void) roll:(NSDictionary*)board{
    int dice = arc4random_uniform(6) + 1;
    NSLog(@"\n%@ have rolled %i", self.name, dice);
    NSInteger newSquare = self.currentSquare + dice;
    if ([board objectForKey:@(newSquare)]){
        if (self.currentSquare < [board[@(newSquare)] integerValue]){
            NSLog(@"Stairway to heaven! Player jumped from %li to %li",
                  self.currentSquare,
                  [board[@(newSquare)] integerValue]);
        } else {
            NSLog(@"You got snaked! Player dropped from %li to %li",
                  self.currentSquare,
                  [board[@(newSquare)] integerValue]);
        }
        self.currentSquare = [board[@(newSquare)] integerValue];
    } else {
        self.currentSquare+= dice;
    }
}

- (void)output{
    if (self.currentSquare >= 100){
        self.currentSquare = 100;
        self.gameOver = YES;
        NSLog(@"Congratulations!\nYou reached the end of the game!");
    } else {
        NSLog(@"You landed on %li", self.currentSquare);
    }
}

@end
