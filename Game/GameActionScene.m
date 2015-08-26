//
//  GameActionScene.m
//  Game
//
//  Created by Feathers, Joel A on 12/5/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import "GameActionScene.h"
#import "GameSprite.h"
#import "GameOverScene.h"
#import "AppDelegate.h"
#import "GameViewController.h"
#import "GameLevelScene.h"

@interface GameActionScene ()
{
    int num;
    int num2;
    int total;
    int remaining;
    int check;
    int check2;
}
@property (strong) GLKBaseEffect * effect;
@property (strong) GameSprite * player;
@property (assign) float timeSinceLastSpawn;
@property (strong) NSMutableArray *projectiles;
@property (strong) NSMutableArray *targets;
@property (strong) GameSprite * background;
@property (assign) int targetsDestroyed;
@end

@implementation GameActionScene
@synthesize effect = _effect;
@synthesize player = _player;
@synthesize background = _background;
@synthesize timeSinceLastSpawn = _timeSinceLastSpawn;
@synthesize projectiles = _projectiles;
@synthesize targets = _targets;
@synthesize targetsDestroyed = _targetsDestroyed;
@synthesize score;
@synthesize level;
@synthesize cards;
@synthesize damage;

- (id)initWithEffect:(GLKBaseEffect *)effect
{
    if ((self = [super init]))
    {
        self.effect = effect;
        
        self.player = [[GameSprite alloc] initWithFile:@"Sprite" effect:self.effect];
        self.player.position = GLKVector2Make(self.player.contentSize.width/2, 160);
        self.player.health = 10;
        
        self.background = [[GameSprite alloc] initWithFile:@"Background.png" effect:self.effect];
        self.background.position = GLKVector2Make(240, 160);
        [self.children addObject:self.background];
        
        [self.children addObject:self.player];
        
        self.projectiles = [NSMutableArray array];
        self.targets = [NSMutableArray array];
        
        GameSprite * lifeSprite = [[GameSprite alloc] initWithFile:@"Life" effect:effect];
        lifeSprite.position = GLKVector2Make(60, 30);
        [self addChild:lifeSprite];
        
        GameSprite * remainingSprite = [[GameSprite alloc] initWithFile:@"Remaining" effect:effect];
        remainingSprite.position = GLKVector2Make(240, 30);
        [self addChild:remainingSprite];
        
        [self lifeCheck];
        
        _targetsDestroyed = 0;
        check = 0;
        check2 = 0;
        
        if (level == 1)
        {
            total = 10;
        }
        else if (level == 2)
        {
            total = 20;
        }
        else if (level == 3)
        {
            total = 30;
        }
        else if (level == 4)
        {
            total = 40;
        }
        else if (level == 5)
        {
            total = 50;
        }
        else if (level == 6)
        {
            total = 60;
        }
        else if (level == 7)
        {
            total = 70;
        }
        else if (level == 8)
        {
            total = 80;
        }
        else if (level == 9)
        {
            total = 90;
        }
        else if (level == 10)
        {
            total = 100;
        }
    }
    return self;
}

- (void)handleTap:(CGPoint)touchLocation
{
    GLKVector2 target1 = GLKVector2Make(touchLocation.x, touchLocation.y);
    GLKVector2 target2 = GLKVector2Make(touchLocation.x, touchLocation.y+50);
    GLKVector2 target3 = GLKVector2Make(touchLocation.x, touchLocation.y-50);
    GLKVector2 target4 = GLKVector2Make(touchLocation.x, touchLocation.y+25);
    GLKVector2 target5 = GLKVector2Make(touchLocation.x, touchLocation.y-25);
    
    GLKVector2 offset1 = GLKVector2Subtract(target1, self.player.position);
    GLKVector2 offset2 = GLKVector2Subtract(target2, self.player.position);
    GLKVector2 offset3 = GLKVector2Subtract(target3, self.player.position);
    GLKVector2 offset4 = GLKVector2Subtract(target4, self.player.position);
    GLKVector2 offset5 = GLKVector2Subtract(target5, self.player.position);
    
    GLKVector2 normalizedOffset1 = GLKVector2Normalize(offset1);
    GLKVector2 normalizedOffset2 = GLKVector2Normalize(offset2);
    GLKVector2 normalizedOffset3 = GLKVector2Normalize(offset3);
    GLKVector2 normalizedOffset4 = GLKVector2Normalize(offset4);
    GLKVector2 normalizedOffset5 = GLKVector2Normalize(offset5);
    
    static float POINTS_PER_SECOND = 480;
    GLKVector2 moveVelocity1 = GLKVector2MultiplyScalar(normalizedOffset1, POINTS_PER_SECOND);
    GLKVector2 moveVelocity2 = GLKVector2MultiplyScalar(normalizedOffset2, POINTS_PER_SECOND);
    GLKVector2 moveVelocity3 = GLKVector2MultiplyScalar(normalizedOffset3, POINTS_PER_SECOND);
    GLKVector2 moveVelocity4 = GLKVector2MultiplyScalar(normalizedOffset4, POINTS_PER_SECOND);
    GLKVector2 moveVelocity5 = GLKVector2MultiplyScalar(normalizedOffset5, POINTS_PER_SECOND);
    
    int cardNum = (arc4random() %3);
    if (cardNum == 0)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity1;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
    else if (cardNum == 1)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity1;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
    else if (cardNum == 2)
    {
        GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
        sprite.position = self.player.position;
        sprite.moveVelocity = moveVelocity1;
        [self.children addObject:sprite];
        [self.projectiles addObject:sprite];
    }
    
    if (cards >= 3)
    {
        cardNum = (arc4random() %3);
        if (cardNum == 0)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity2;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 1)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity2;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 2)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity2;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        
        cardNum = (arc4random() %3);
        if (cardNum == 0)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity3;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 1)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity3;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 2)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity3;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
    }
    
    if (cards == 5)
    {
        cardNum = (arc4random() %3);
        if (cardNum == 0)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity4;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 1)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity4;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 2)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity4;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        
        cardNum = (arc4random() %3);
        if (cardNum == 0)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Blue" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity5;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 1)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Red" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity5;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
        else if (cardNum == 2)
        {
            GameSprite * sprite = [[GameSprite alloc] initWithFile:@"Yellow" effect:self.effect];
            sprite.position = self.player.position;
            sprite.moveVelocity = moveVelocity5;
            [self.children addObject:sprite];
            [self.projectiles addObject:sprite];
        }
    }
}

- (void)addTarget
{
    GameSprite * target = [[GameSprite alloc] initWithFile:@"Fidsprite" effect:self.effect];
    [self.children addObject:target];
    
    int minY = target.contentSize.height/2;
    int maxY = 320 - target.contentSize.height/2;
    int rangeY = maxY - minY;
    int actualY = (arc4random() % rangeY) + minY;
    
    target.position = GLKVector2Make(480 + (target.contentSize.width/2), actualY);
    
    int minVelocity = 480.0/4.0;
    int maxVelocity = 480.0/2.0;
    int rangeVelocity = maxVelocity - minVelocity;
    int actualVelocity = (arc4random() % rangeVelocity) + minVelocity;
    
    target.moveVelocity = GLKVector2Make(-actualVelocity, 0);
    if (level == 1)
    {
        target.health = 1;
    }
    else if (level == 2)
    {
        target.health = 2;
    }
    else if (level == 3)
    {
        target.health = 2;
    }
    else if (level == 4)
    {
        target.health = 6;
    }
    else if (level == 5)
    {
        target.health = 12;
    }
    else if (level == 6)
    {
        target.health = 24;
    }
    else if (level == 7)
    {
        target.health = 28;
    }
    else if (level == 8)
    {
        target.health = 32;
    }
    else if (level == 9)
    {
        target.health = 36;
    }
    else if (level == 10)
    {
        target.health = 40;
    }
    
    [self.targets addObject:target];
}

- (void)gameOver:(BOOL)win
{
    GameOverScene * scene = [GameOverScene alloc];
    scene.score = scene.score + num;
    scene.num = score;
    scene.level = level;
    scene.cards = cards;
    scene.damage = damage;
    scene = [scene initWithEffect:self.effect win:win];
    
    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    UIWindow * mainWindow = [delegate window];
    GameViewController * viewController = (GameViewController *) mainWindow.rootViewController;
    viewController.scene = scene;
}

-(void)lifeCheck
{
        if (self.player.health == 10)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
    
            GameSprite * numSprite2 = [[GameSprite alloc] initWithFile:@"Zero" effect:self.effect];
            numSprite2.position = GLKVector2Make(110, 25);
            [self.children addObject:numSprite2];
        }
        else if (self.player.health == 9)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 8)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 7)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 6)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 5)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 4)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 3)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 2)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
        else if (self.player.health == 1)
        {
            GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:self.effect];
            numSprite.position = GLKVector2Make(90, 25);
            [self.children addObject:numSprite];
        }
}

- (void)update:(float)dt
{
    [super update:dt];
    
    NSMutableArray * projectilesToDelete = [NSMutableArray array];
    for (GameSprite * projectile in self.projectiles)
    {
        
        NSMutableArray * targetsToDelete = [NSMutableArray array];
        for (GameSprite * target in self.targets)
        {
            if (CGRectIntersectsRect(projectile.boundingBox, target.boundingBox))
            {
                if (damage == 1)
                {
                    target.health = target.health - 1;
                }
                else if (damage == 2)
                {
                    target.health = target.health - 2;
                }
                else if (damage == 3)
                {
                    target.health = target.health - 3;
                }
                [projectilesToDelete addObject:projectile];
                if (target.health <= 0)
                {
                    [targetsToDelete addObject:target];
                    num = num + (1 * level);
                }
            }
        }
        
        for (GameSprite * target in targetsToDelete)
        {
            [self.targets removeObject:target];
            [self.children removeObject:target];
            _targetsDestroyed++;
            check2 = 1;
        }
    }
    
    remaining = total - _targetsDestroyed;
    
    if (remaining/100 == 1)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:self.effect];
        numSprite.position = GLKVector2Make(320, 25);
        [self addChild:numSprite];
        
        GameSprite * numSprite2 = [[GameSprite alloc] initWithFile:@"Zero" effect:self.effect];
        numSprite2.position = GLKVector2Make(340, 25);
        [self addChild:numSprite2];
        
        GameSprite * numSprite3 = [[GameSprite alloc] initWithFile:@"Zero" effect:self.effect];
        numSprite3.position = GLKVector2Make(360, 25);
        [self addChild:numSprite3];
    }
    
    remaining = remaining - ((remaining/100) * 100);
    
    if (remaining/10 == 1)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 2)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 3)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 4)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 5)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 6)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 7)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 8)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 9)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    else if (remaining/10 == 0 && remaining >= 10)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:self.effect];
        numSprite.position = GLKVector2Make(340, 25);
        [self addChild:numSprite];
    }
    
    remaining = remaining - ((remaining/10) * 10);
    
    if (remaining == 1)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"One" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 2)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Two" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 3)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Three" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 4)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Four" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 5)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Five" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 6)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Six" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 7)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Seven" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 8)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Eight" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 9)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Nine" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    else if (remaining == 0)
    {
        GameSprite * numSprite = [[GameSprite alloc] initWithFile:@"Zero" effect:self.effect];
        numSprite.position = GLKVector2Make(360, 25);
        [self addChild:numSprite];
    }
    
    if (check2 == 1)
    {
        for (int i = self.children.count - 1; i >= 0; i--)
        {
            GameSprite * sprite = [self.children objectAtIndex:i];
            
            if (sprite.position.x == 320 && sprite.position.y == 25)
            {
                [self.children removeObjectAtIndex:i];
            }
            if (sprite.position.x == 340 && sprite.position.y == 25)
            {
                [self.children removeObjectAtIndex:i];
            }
            if (sprite.position.x == 360 && sprite.position.y == 25)
            {
                [self.children removeObjectAtIndex:i];
            }
            check2 = 0;
        }
    }
    
    
    for (GameSprite * projectile in projectilesToDelete)
    {
        [self.projectiles removeObject:projectile];
        [self.children removeObject:projectile];
    }
    
    self.timeSinceLastSpawn += dt;
    if (self.timeSinceLastSpawn > 0.5)
    {
        self.timeSinceLastSpawn = 0;
        [self addTarget];
    }
    
    if (level == 1)
    {
        if (_targetsDestroyed >= 10)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 2)
    {
        if (_targetsDestroyed >= 20)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 3)
    {
        if (_targetsDestroyed >= 30)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 4)
    {
        if (_targetsDestroyed >= 40)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 5)
    {
        if (_targetsDestroyed >= 50)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 6)
    {
        if (_targetsDestroyed >= 60)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 7)
    {
        if (_targetsDestroyed >= 70)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 8)
    {
        if (_targetsDestroyed >= 80)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 9)
    {
        if (_targetsDestroyed >= 90)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    else if (level == 10)
    {
        if (_targetsDestroyed >= 100)
        {
            level++;
            [self gameOver:YES];
            return;
        }
    }
    
    BOOL lose = NO;
    for (int i = self.children.count - 1; i >= 0; i--)
    {
        
        GameSprite * sprite = [self.children objectAtIndex:i];
        
        if (sprite.position.x <= -sprite.contentSize.width/2 ||
            sprite.position.x > 480 + sprite.contentSize.width/2 ||
            sprite.position.y <= -sprite.contentSize.height/2 ||
            sprite.position.y >= 320 + sprite.contentSize.height/2)
        {
            
            if ([self.targets containsObject:sprite])
            {
                check = 1;
                [self.targets removeObject:sprite];
                [self.children removeObjectAtIndex:i];
                self.player.health = self.player.health - 1;
                if (self.player.health <= 0)
                {
                    lose = YES;
                }
            }
            else if ([self.projectiles containsObject:sprite])
            {
                [self.projectiles removeObject:sprite];
                [self.children removeObjectAtIndex:i];
            }
        }
    }
    if (check == 1)
    {
        for (int i = self.children.count - 1; i >= 0; i--)
        {
            GameSprite * sprite = [self.children objectAtIndex:i];
            
            if (sprite.position.x == 90 && sprite.position.y == 25)
            {
                [self.children removeObjectAtIndex:i];
            }
            if (sprite.position.x == 110 && sprite.position.y == 25)
            {
                [self.children removeObjectAtIndex:i];
            }
        }
        [self lifeCheck];
    }
    if (lose)
    {
        [self gameOver:NO];
    }
}

@end