//
//  GameMenuScene.h
//  Game
//
//  Created by Feathers, Joel A on 12/6/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameNode.h"

@interface GameMenuScene : GameNode

@property int score;
@property int cards;
@property int damage;
- (id)initWithEffect:(GLKBaseEffect *)effect first:(BOOL)first;

@end
