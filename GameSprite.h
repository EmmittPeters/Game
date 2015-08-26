//
//  GameSprite.h
//  Game
//
//  Created by Feathers, Joel A on 12/4/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "GameNode.h"

@interface GameSprite : GameNode

- (id)initWithFile:(NSString *)fileName effect:(GLKBaseEffect *)effect;

@end
