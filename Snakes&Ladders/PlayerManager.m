//
//  PlayerManager.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "PlayerManager.h"

@implementation PlayerManager
- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [NSMutableArray new];
    }
    return self;
}

-(void) createPlayers: (int) numberOfPlayers{
    
    for (int i = 0; i <numberOfPlayers ; i++) {
        Player * player = [Player new];
        [_players addObject: player];
        
    }
}
@end
