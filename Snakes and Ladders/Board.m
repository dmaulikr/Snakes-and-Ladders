//
//  Board.m
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import "Board.h"

@implementation Board{
    NSMutableDictionary *randomBoard;
    NSMutableArray *allSquares;
}


- (instancetype)init
{
    self = [self initWithSnakes:10 andLadders:15];
    return self;
}

- (instancetype)initWithSnakes:(NSInteger)snakes andLadders:(NSInteger)ladders
{
    self = [super init];
    if (self) {
        _numberOfSnakes = snakes;
        _numberOfLadders = ladders;
        randomBoard = [[NSMutableDictionary alloc] init];
        allSquares = [[NSMutableArray alloc] init];
        for (int i = 2; i < 100; i++){[allSquares addObject:@(i)];} //Array of tile 2 to 98
        [self generateBoard];
    }
    return self;
}

- (void) generateBoard{
    //Generate ladders
    for (int i = 0; i < self.numberOfLadders; i++){
        int rand1 = arc4random_uniform((int)allSquares.count);
        int rand2 = arc4random_uniform((int)allSquares.count);
        NSNumber *squareIndex1 = allSquares[rand1];
        NSNumber *squareIndex2 = allSquares[rand2];
        [allSquares removeObject:squareIndex1];
        [allSquares removeObject:squareIndex2];
        if ([squareIndex1 intValue] > [squareIndex2 intValue]){
            [randomBoard setObject:squareIndex2 forKey:squareIndex1];
        } else {
            [randomBoard setObject:squareIndex1 forKey:squareIndex2];
            
        }
    }
    //Generate snakes
    for (int i = 0; i < self.numberOfSnakes; i++){
        int rand1 = arc4random_uniform((int)allSquares.count);
        int rand2 = arc4random_uniform((int)allSquares.count);
        NSNumber *squareIndex1 = allSquares[rand1];
        NSNumber *squareIndex2 = allSquares[rand2];
        [allSquares removeObject:squareIndex1];
        [allSquares removeObject:squareIndex2];
        if (rand1 > rand2){
            [randomBoard setObject:squareIndex1 forKey:squareIndex2];
        } else {
            [randomBoard setObject:squareIndex2 forKey:squareIndex1];
        }

    }
    _boardLayout = [randomBoard copy];
}

@end
