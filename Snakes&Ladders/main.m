//
//  main.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Constants
        static NSString * welcome = @"WELCOME TO SNAKES & LADDERS";
        static NSString * instructions = @"Please type \"roll\" or \"r\"";
        static NSString * gameOverMessage = @"Bye";
        static NSString * enterNumberOfPlayerMessage = @"Please, type the number of player:";
        static NSString * invalidNumberMessage = @"Invalid number. :(";
        
        //Variables
        PlayerManager * manager = [PlayerManager new];
        
        
        //Begin
       
        NSLog(@"%@", welcome);
        
        do {
            //Ask the number of players
            while (manager.players.count <= 0) {
                NSLog(@"%@", enterNumberOfPlayerMessage);
                
                char inputCharPlayers[255];
                
                fgets(inputCharPlayers, 255, stdin);
                NSString *inputPlayers = [[NSString stringWithCString:inputCharPlayers
                                                      encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
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
            
            char inputChar[255];
            
            fgets(inputChar, 255, stdin);
            NSString *input = [[NSString stringWithCString:inputChar
                                                     encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                
                [manager roll];
                
                if([manager gameOver]) {
                    NSLog(@"%@", manager.output);
                    NSLog(@"%@", [manager score]);
                    [manager.players removeAllObjects];
                    continue;
                } else {
                    NSLog(@"%@", manager.output);
                    NSLog(@"%@", [manager score]);
                }
            }
            
        }while(YES);
        
    }
    return 0;
}
