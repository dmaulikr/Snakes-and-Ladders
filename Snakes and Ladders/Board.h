//
//  Board.h
//  Snakes and Ladders
//
//  Created by Errol Cheong on 2017-06-30.
//  Copyright © 2017 Errol Cheong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (nonatomic, strong) NSDictionary* boardLayout;
@property (nonatomic, assign) NSInteger numberOfSnakes;
@property (nonatomic, assign) NSInteger numberOfLadders;

- (instancetype)initWithSnakes:(NSInteger)snakes andLadders:(NSInteger)ladders;
- (void) generateBoard;

@end
