//
//  Player.h
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject
//Properties
@property (nonatomic, assign) NSInteger currentSquare;
@property (nonatomic, strong) NSDictionary<NSNumber*, NSNumber*> * gameLogic;
@property (nonatomic, assign) BOOL gameOver;
@property (nonatomic, strong) NSString * output;
@property (nonatomic, strong) NSString * name;

//Methods
-(void) roll;
@end

NS_ASSUME_NONNULL_END
