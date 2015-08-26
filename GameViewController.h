//
//  GameViewController.h
//  Game
//
//  Created by Feathers, Joel A on 12/4/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "GameNode.h"

@interface GameViewController : GLKViewController

@property (strong) GameNode * scene;

@end
