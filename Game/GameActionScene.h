//
//  GameActionScene.h
//  Game
//
//  Created by Feathers, Joel A on 12/5/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameNode.h"

@interface GameActionScene : GameNode

@property int score;
@property int level;
@property int cards;
@property int damage;
- (id)initWithEffect:(GLKBaseEffect *)effect;
-(void)lifeCheck;

@end
