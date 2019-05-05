//
//  Player.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "Player.h"

@implementation Player
-(void) roll{
    
    NSInteger dice = [self randomNumberBetween:1 andMax:6];
    NSLog(@"%lu", dice);
}


-(NSInteger)randomNumberBetween: (NSInteger) min andMax:(NSInteger) max {
    return  (min + arc4random_uniform((uint32_t)(max - min + 1)));
}
@end
