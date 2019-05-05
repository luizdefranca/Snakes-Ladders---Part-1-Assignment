//
//  main.m
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
        //Constants
        static NSString * welcome = @"WELCOME TO SNAKES & LADDERS";
        static NSString * instructions = @"Please type \"roll\"or \"r\"";
        
        //Begin
        BOOL gameON = YES;
        NSLog(@"%@", welcome);
        NSLog(@"%@", instructions);
        
        Player *player = [Player new];
        
        while (gameON) {
            
            
            char inputChar[255];
            
            fgets(inputChar, 255, stdin);
            NSString *input = [[NSString stringWithCString:inputChar
                                                     encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            
            if ([input isEqualToString:@"roll"] || [input isEqualToString:@"r"]) {
                [player roll];
            }
            
        }
        
    }
    return 0;
}
