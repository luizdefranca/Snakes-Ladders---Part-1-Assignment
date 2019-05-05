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
        
        //Ask the number of players
        while (manager.players.count <= 0) {
            NSLog(@"%@", enterNumberOfPlayerMessage);
            
            char inputChar[255];
            
            fgets(inputChar, 255, stdin);
            NSString *input = [[NSString stringWithCString:inputChar
                                                  encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            int  numberOfPlayer = input.intValue;
            
            if (numberOfPlayer) {
                [manager createPlayers:numberOfPlayer];
                NSLog(@"Number of Players: %lu", manager.players.count);
            } else {
                NSLog(@"%@", invalidNumberMessage);
            }
        }
        
        
       
        
        
        while (YES) {
            NSLog(@"%@", instructions);
            
            char inputChar[255];
            
            fgets(inputChar, 255, stdin);
            NSString *input = [[NSString stringWithCString:inputChar
                                                     encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                
                [manager roll];
                NSString *output = manager.output;
                //NSLog(@"Player%lu", ([manager currentIndex] % manager.players.count) + 1);
                NSLog(@"%@", output);
                if([manager gameOver]) {
                    NSLog(@"%@", manager.output) ;
                    break;
                }
            }
            
        }
        NSLog(@"%@", gameOverMessage);
    }
    return 0;
}
