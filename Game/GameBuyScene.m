//
//  GameBuyScene.m
//  Game
//
//  Created by Feathers, Joel A on 12/7/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameBuyScene.h"
#import "GameShopScene.h"
#import "GameMenuScene.h"
#import "GameLevelScene.h"
#import "GameOverScene.h"
#import "GameSprite.h"
#import "GameViewController.h"
#import "GameActionScene.h"
#import "AppDelegate.h"

@interface GameBuyScene ()
@property (assign) float timeSinceInit;
@property (strong) GLKBaseEffect * effect;
@property (strong) GameSprite * background;
@end

@implementation GameBuyScene
@synthesize timeSinceInit = _timeSinceInit;
@synthesize effect = _effect;
@synthesize background = _background;
@synthesize ingame;
@synthesize score;
@synthesize level;
@synthesize cards;
@synthesize damage;

- (id)initWithEffect:(GLKBaseEffect *)effect
{
    if ((self = [super init]))
    {
        self.effect = effect;
        
        self.background = [[GameSprite alloc] initWithFile:@"Background.png" effect:self.effect];
        self.background.position = GLKVector2Make(240, 160);
        [self.children addObject:self.background];
        
        GameSprite * buySprite = [[GameSprite alloc] initWithFile:@"UpgradeBuy" effect:effect];
        buySprite.position = GLKVector2Make(240, 160);
        [self addChild:buySprite];
    }
    return self;
}

- (void)update:(float)dt
{
    self.timeSinceInit += dt;
    if (self.timeSinceInit > 3.0)
    {
        GameShopScene * scene = [GameShopScene alloc];
        scene.score = score;
        scene.level = level;
        scene.ingame = ingame;
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
