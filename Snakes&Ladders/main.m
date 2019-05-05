//
//  main.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Constants
        static NSString * welcome = @"WELCOME TO SNAKES & LADDERS";
        static NSString * instructions = @"Please type \"roll\"or \"r\"";
        static NSString * gameOverMessage = @"Bye";
        
        //Begin
       
        NSLog(@"%@", welcome);
        NSLog(@"%@", instructions);
       
        PlayerManager * manager = [PlayerManager new];
        Player *player = [Player new];
        
        while (YES) {
            
            
            char inputChar[255];
            
            fgets(inputChar, 255, stdin);
            NSString *input = [[NSString stringWithCString:inputChar
                                                     encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                [player roll];
                if(player.gameOver) {
                    NSLog(@"%@", player.output) ;
                    break;
                }
            }
            
        }
        NSLog(@"%@", gameOverMessage);
    }
    return 0;
}
