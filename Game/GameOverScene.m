//
//  GameOverScene.m
//  Game
//
//  Created by Feathers, Joel A on 12/5/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameOverScene.h"
#import "GameSprite.h"
#import "GameViewController.h"
#import "GameActionScene.h"
#import "AppDelegate.h"
#import "GameLevelScene.h"
#import "GameMenuScene.h"
#import "GameShopScene.h"

@interface GameOverScene ()
{
    int winner;
}
@property (assign) float timeSinceInit;
@property (strong) GLKBaseEffect * effect;
@end

@implementation GameOverScene
@synthesize timeSinceInit = _timeSinceInit;
@synthesize effect = _effect;
@synthesize score;
@synthesize num;
@synthesize level;
@synthesize cards;
@synthesize damage;

- (id)initWithEffect:(GLKBaseEffect *)effect win:(BOOL)win
{
    if ((self = [super init]))
    {
        self.effect = effect;
        GameSprite * background = [[GameSprite alloc] initWithFile:@"Background.png" effect:self.effect];
        background.position = GLKVector2Make(240, 160);
        [self addChild:background];
        GameSprite * scoreSprite = [[GameSprite alloc] initWithFile:@"Score" effect:effect];
        scoreSprite.position = GLKVector2Make(175, 30);
        [self addChild:scoreSprite];
        
        //score checking
        score = score + num;
        num = score;
        if (score/1000 == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        else if (score/1000 == 0)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:effect];
            numSprite.position = GLKVector2Make(280, 25);
            [self addChild:numSprite];
        }
        
        score = score - ((score/1000) * 1000);
        
        if (score/100 == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        else if (score/100 == 0)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:effect];
            numSprite.position = GLKVector2Make(310, 25);
            [self addChild:numSprite];
        }
        
        score = score - ((score/100) * 100);
        
        if (score/10 == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        else if (score/10 == 0)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:effect];
            numSprite.position = GLKVector2Make(340, 25);
            [self addChild:numSprite];
        }
        
        score = score - ((score/10) * 10);
        
        if (score == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        else if (score == 0)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:effect];
            numSprite.position = GLKVector2Make(370, 25);
            [self addChild:numSprite];
        }
        score = 0;
        score = num;
        //end of score checking
        
        if (win)
        {
            GameSprite * winSprite = [[GameSprite alloc] initWithFile:@"YouWin.png" effect:effect];
            winSprite.position = GLKVector2Make(240, 160);
            [self addChild:winSprite];
            winner = 1;
        }
        else
        {
            GameSprite * loseSprite = [[GameSprite alloc] initWithFile:@"YouLose.png" effect:effect];
            loseSprite.position = GLKVector2Make(240, 160);
            [self addChild:loseSprite];
            winner = 0;
        }
        
    }
    return self;
}

- (void)update:(float)dt
{
    self.timeSinceInit += dt;
    if (self.timeSinceInit > 3.0)
    {
        if (winner == 1 && level <= 10)
        {
            GameShopScene * scene = [GameShopScene alloc];
            scene.score = score;
            scene.level = level;
            scene.ingame = 1;
            scene.cards = cards;
            scene.damage = damage;
            scene = [scene initWithEffect:self.effect];
            AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
            UIWindow * mainWindow = [delegate window];
            GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
            viewController.scene = scene;
        }
        else
        {
            GameMenuScene * scene = [GameMenuScene alloc];
            scene.score = score;
            scene.cards = cards;
            scene.damage = damage;
            scene = [scene initWithEffect:self.effect first:NO];
            AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
            UIWindow * mainWindow = [delegate window];
            GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
            viewController.scene = scene;
        }
    }
    
}

@end