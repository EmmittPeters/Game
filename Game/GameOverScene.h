//
//  GameOverScene.h
//  Game
//
//  Created by Feathers, Joel A on 12/5/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameNode.h"

@interface GameOverScene : GameNode

@property int score;
@property int num;
@property int level;
@property int cards;
@property int damage;
- (id)initWithEffect:(GLKBaseEffect *)effect win:(BOOL)win;

@end