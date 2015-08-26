//
//  GameBuyScene.h
//  Game
//
//  Created by Feathers, Joel A on 12/7/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameNode.h"

@interface GameBuyScene : GameNode

@property int score;
@property int ingame;
@property int level;
@property int cards;
@property int damage;
- (id)initWithEffect:(GLKBaseEffect *)effect;

@end
