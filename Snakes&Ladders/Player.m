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
        _gameLogic = @{@4:@14, @17:@7, @9:@31, @20:@38, @40:@89, @51:@67, @63:@81, @64:@60, @89:@26, @95:@75, @99:@78};
        _gameOver = NO;
       
    }
    return self;
}


//Methods
-(void) roll{
    
    //Constant messages
    static NSString * rolledDieMessage = @"You rolled a ";
    static NSString * landedOnMessage = @"You landed on ";
    static NSString * ladderMessage = @"Stairway to heaven! You jumped from ";
    static NSString * snakeMessage = @"Bad luck! You have to come back from ";
    static NSString * gameOverMessage = @"YOU WIN. CONGRATULATION!!!";
    
    //Variables
    NSInteger die = [self randomNumberBetween:1 andMax:6];
    NSMutableString *message = [NSMutableString new];
    [ message appendFormat: @"\n%@%lu\n", rolledDieMessage, die ];
    
//    NSLog(@"%@%lu", rolledDieMessage, die);
    
    NSNumber * candidateSquare = [NSNumber numberWithInteger: _currentSquare + die];
    
    NSNumber *nextSquare = _gameLogic[candidateSquare];
    if (nextSquare) {
        if([nextSquare isLessThan: candidateSquare]) {
            [message appendFormat: @"%@%lu to %i", snakeMessage, candidateSquare.integerValue, nextSquare.intValue ];
            //NSLog(@"%@%lu to %i", snakeMessage, candidateSquare.integerValue, nextSquare.intValue);
        } else {
            [message appendFormat: @"%@%lu to %i", ladderMessage, candidateSquare.integerValue, nextSquare.intValue];
            //NSLog(@"%@%lu to %i", snakeMessage, candidateSquare.integerValue, nextSquare.intValue);
        }
        _currentSquare = nextSquare.integerValue;
    } else {
        _currentSquare = candidateSquare.integerValue;
        if(_currentSquare >= 100) {
            _gameOver = YES;
            _output = gameOverMessage;
        } else {
            [message appendFormat: @"%@%lu", landedOnMessage, _currentSquare];
            //NSLog(@"%@%lu", landedOnMessage, _currentSquare);
        }
    }
    
    _output = message;
}

//Private Method
-(NSInteger)randomNumberBetween: (NSInteger) min andMax:(NSInteger) max {
    return  (min + arc4random_uniform((uint32_t)(max - min + 1)));
}
@end
