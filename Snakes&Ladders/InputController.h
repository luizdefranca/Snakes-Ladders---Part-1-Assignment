//
//  InputController.h
//  Snakes&Ladders
//
//  Created by Luiz on 5/5/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputController : NSObject
-(NSString*) stringFromInput;
-(NSString*) inputForPrompt:(NSString *)promptString;
@end

NS_ASSUME_NONNULL_END
