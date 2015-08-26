//
//  GameLevelScene.m
//  Game
//
//  Created by Feathers, Joel A on 12/6/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameLevelScene.h"
#import "GameOverScene.h"
#import "GameSprite.h"
#import "GameViewController.h"
#import "GameActionScene.h"
#import "AppDelegate.h"

@interface GameLevelScene ()
@property (assign) float timeSinceInit;
@property (strong) GLKBaseEffect * effect;
@end

@implementation GameLevelScene
@synthesize timeSinceInit = _timeSinceInit;
@synthesize effect = _effect;
@synthesize score;
@synthesize level;
@synthesize cards;
@synthesize damage;

- (id)initWithEffect:(GLKBaseEffect *)effect first:(BOOL)first
{
    if ((self = [super init]))
    {
        if (first == YES)
        {
            level = 1;
        }
        self.effect = effect;
        GameSprite * background = [[GameSprite alloc] initWithFile:@"Background.png" effect:self.effect];
        background.position = GLKVector2Make(240, 160);
        [self addChild:background];
        
        GameSprite * levelSprite = [[GameSprite alloc] initWithFile:@"Level" effect:effect];
        levelSprite.position = GLKVector2Make(200, 163);
        [self addChild:levelSprite];
        
        if (level == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
        }
        else if (level == 10)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(280, 160);
            [self addChild:numSprite];
            
            GameSprite * numSprite2 = [[GameSprite alloc] initWithFile:@"Zero" effect:effect];
            numSprite2.position = GLKVector2Make(310, 160);
            [self addChild:numSprite2];
        }
    }
    return self;
}

- (void)update:(float)dt
{
    self.timeSinceInit += dt;
    if (self.timeSinceInit > 3.0)
    {
        GameActionScene * scene = [GameActionScene alloc];
        scene.score = score;
        scene.level = level;
        scene.cards = cards;
        scene.damage = damage;
        scene = [scene initWithEffect:self.effect];
        AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
        UIWindow * mainWindow = [delegate window];
        GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
        viewController.scene = scene;
    }
}

@end
