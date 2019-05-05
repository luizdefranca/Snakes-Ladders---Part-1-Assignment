//
//  main.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlayerManager.h"
#import "InputController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Constants
        static NSString * welcome = @"WELCOME TO SNAKES & LADDERS";
        static NSString * instructions = @"Please type \"roll\" or \"r\"";
        static NSString * gameOverMessage = @"Bye";
        static NSString * enterNumberOfPlayerMessage = @"Please, type the number of player:";
        static NSString * invalidNumberMessage = @"Invalid number. :(";
        static NSString * confirmationMessage = @"Would you like to \"quit\" or \"restart\"";
        
        //Variables
        BOOL gameOn = YES;
        PlayerManager * manager = [PlayerManager new];
        InputController *inputController = [InputController new];
        
        //Begin
       
        NSLog(@"%@", welcome);
        
        do {
            //Ask the number of players
            while (manager.players.count <= 0) {
                NSLog(@"%@", enterNumberOfPlayerMessage);
                NSString *inputPlayers = [inputController stringFromInput];
                int  numberOfPlayer = inputPlayers.intValue;
                
                if (numberOfPlayer) {
                    [manager createPlayers:numberOfPlayer];
                    NSLog(@"Number of Players: %lu", manager.players.count);
                    break;
                } else {
                    NSLog(@"%@", invalidNumberMessage);
                }
            }
            
            NSLog(@"%@", instructions);
            NSString *input = [inputController stringFromInput];
            input = [input lowercaseString];
            
            if ([input isEqualToString: @"quit"] || [input isEqualToString: @"q"]) {
                NSLog(@"%@", confirmationMessage);
                NSString * confirmation = [inputController stringFromInput];
                if ([confirmation isEqualToString:@"q"] || [confirmation isEqualToString: @"quit"]) {
                    gameOn = NO;
                    NSLog(@"%@", gameOverMessage);
                } else {
                    [manager restart];
                    continue;
                }
                
            }
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                
                [manager roll];
                
                if([manager gameOver]) {
                    NSLog(@"%@", manager.output);
                    NSLog(@"%@", [manager score]);
                    [manager restart];
                    continue;
                } else {
                    NSLog(@"%@", manager.output);
                    NSLog(@"%@", [manager score]);
                }
            }
            
        }while(gameOn);
        
    }
    return 0;
}
