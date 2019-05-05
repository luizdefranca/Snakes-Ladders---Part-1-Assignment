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
        _currentIndex = 0;
    }
    return self;
}

-(void) createPlayers: (int) numberOfPlayers {
    
    for (int i = 0; i <numberOfPlayers ; i++) {
        Player * player = [Player new];
        player.name = [NSString stringWithFormat: @"player%i", i+1];
        [_players addObject: player];
        
    }
}

-(void) roll  {
    Player *actualPlayer = self.currentPlayer;
    [actualPlayer roll];
    _output = [actualPlayer.output stringByReplacingOccurrencesOfString:@"You" withString: actualPlayer.name];
    _output = [_output stringByReplacingOccurrencesOfString:@"YOU" withString: actualPlayer.name];
    
    _currentIndex ++;
}

-(Player*) currentPlayer {
    return _players[(_currentIndex % _players.count) ];
}


-(BOOL) gameOver {
   
    return _players[(_currentIndex - 1) % _players.count].gameOver;
}
-(NSString*) score{
    NSMutableString * score = [NSMutableString stringWithString: @"score: "];
    for (Player * player in _players) {
        [score appendFormat:@"%@: %lu, ", player.name, player.currentSquare];
    }
    //Remove the last comma.
    [score replaceCharactersInRange: NSMakeRange([score length] -2, 1) withString: @""] ;
    return score;
}

-(void) restart{
    [_players removeAllObjects];
};
@end
