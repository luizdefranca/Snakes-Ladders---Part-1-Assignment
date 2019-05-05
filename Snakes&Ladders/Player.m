//
//  Player.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "Player.h"

@implementation Player
//Initializers
- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
    }
    return self;
}


//Methods
-(void) roll{
    
    NSInteger die = [self randomNumberBetween:1 andMax:6];
    NSLog(@"%lu", die);
    NSLog(@"currentSquare -> %lu", _currentSquare);
    _currentSquare += die;
    NSLog(@"currentSquare after increment value -> %lu", _currentSquare);
}

//Private Method
-(NSInteger)randomNumberBetween: (NSInteger) min andMax:(NSInteger) max {
    return  (min + arc4random_uniform((uint32_t)(max - min + 1)));
}
@end
