//
//  GameMenuScene.m
//  Game
//
//  Created by Feathers, Joel A on 12/6/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameMenuScene.h"
#import "GameLevelScene.h"
#import "GameOverScene.h"
#import "GameSprite.h"
#import "GameViewController.h"
#import "GameActionScene.h"
#import "AppDelegate.h"
#import "GameShopScene.h"

@interface GameMenuScene ()
{
    GameSprite * playTarget;
    GameSprite * shopTarget;
}
@property (assign) float timeSinceInit;
@property (strong) GLKBaseEffect * effect;
@property (strong) GameSprite * player;
@property (strong) NSMutableArray *projectiles;
@property (strong) GameSprite * background;
@property (strong) NSMutableArray *targets;
@property (strong) GameSprite * title;
@end

@implementation GameMenuScene
@synthesize timeSinceInit = _timeSinceInit;
@synthesize effect = _effect;
@synthesize player = _player;
@synthesize background = _background;
@synthesize projectiles = _projectiles;
@synthesize targets = _targets;
@synthesize title = _title;
@synthesize score;
@synthesize cards;
@synthesize damage;

- (id)initWithEffect:(GLKBaseEffect *)effect first:(BOOL)first
{
    if ((self = [super init]))
    {
        if (first == YES)
        {
            score = 0;
            cards = 1;
            damage = 1;
        }
        self.effect = effect;
        
        self.player = [[GameSprite alloc] initWithFile:@"Sprite" effect:self.effect];
        self.player.position = GLKVector2Make(240, 160);
        
        self.background = [[GameSprite alloc] initWithFile:@"Background.png" effect:self.effect];
        self.background.position = GLKVector2Make(240, 160);
        [self.children addObject:self.background];
        
        self.title = [[GameSprite alloc] initWithFile:@"Title" effect:self.effect];
        self.title.position = GLKVector2Make(240, 290);
        [self.children addObject:self.title];
        
        [self.children addObject:self.player];
        
        self.projectiles = [NSMutableArray array];
        
        playTarget = [[GameSprite alloc] initWithFile:@"Play" effect:self.effect];
        playTarget.position = GLKVector2Make(60, 160);
        [self.children addObject:playTarget];
        
        shopTarget = [[GameSprite alloc] initWithFile:@"Shop" effect:self.effect];
        shopTarget.position = GLKVector2Make(420, 160);
        [self.children addObject:shopTarget];
        
        GameSprite * scoreSprite = [[GameSprite alloc] initWithFile:@"Score" effect:effect];
        scoreSprite.position = GLKVector2Make(175, 30);
        [self addChild:scoreSprite];
        
        //score checking
        int num;
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
    }
    return self;
}

- (void)handleTap:(CGPoint)touchLocation
{
    GLKVector2 target = GLKVector2Make(touchLocation.x, touchLocation.y);
    GLKVector2 offset = GLKVector2Subtract(target, self.player.position);
    
    GLKVector2 normalizedOffset = GLKVector2Normalize(offset);
    
    static float POINTS_PER_SECOND = 480;
    GLKVector2 moveVelocity = GLKVector2MultiplyScalar(normalizedOffset, POINTS_PER_SECOND);
    
    int cardNum = (arc4random() %3);
    if (cardNum == 0)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
    else if (cardNum == 1)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
    else if (cardNum == 2)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
}

- (void)update:(float)dt
{
    [super update:dt];
    
    NSMutableArray * projectilesToDelete = [NSMutableArray array];
    for (GameSprite * projectile in self.projectiles)
    {
        if (CGRectIntersectsRect(projectile.boundingBox, playTarget.boundingBoxMenuItem))
        {
            [projectilesToDelete addObject:projectile];
            GameLevelScene * scene = [GameLevelScene alloc];
            scene.score = score;
            scene.cards = cards;
            scene.damage = damage;
            scene = [scene initWithEffect:self.effect first:YES];
            AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
            UIWindow * mainWindow = [delegate window];
            GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
            viewController.scene = scene;
        }
        if (CGRectIntersectsRect(projectile.boundingBox, shopTarget.boundingBoxMenuItem))
        {
            [projectilesToDelete addObject:projectile];
            GameShopScene * scene = [GameShopScene alloc];
            scene.score = score;
            scene.ingame = 0;
            scene.cards = cards;
            scene.damage = damage;
            scene = [scene initWithEffect:self.effect];
            AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
            UIWindow * mainWindow = [delegate window];
            GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
            viewController.scene = scene;
        }
    }
    
    for (GameSprite * projectile in projectilesToDelete)
    {
        [self.projectiles removeObject:projectile];
        [self.children removeObject:projectile];
    }
}

@end
