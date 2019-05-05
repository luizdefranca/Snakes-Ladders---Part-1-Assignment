//
//  PlayerManager.h
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject

//Properties
@property (nonatomic, strong) NSMutableArray * players;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic, strong) NSString * output;
//Methods
-(void) createPlayers: (int) numberOfPlayers;
-(void) roll;

-(Player*) currentPlayer;
-(BOOL) gameOver;
@end

NS_ASSUME_NONNULL_END
