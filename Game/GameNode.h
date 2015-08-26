//
//  GameNode.h
//  Game
//
//  Created by Feathers, Joel A on 12/5/13.
//  Copyright (c) 2013 Feathers, Joel A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@interface GameNode : NSObject

@property (assign) GLKVector2 position;
@property (assign) CGSize contentSize;
@property (assign) GLKVector2 moveVelocity;
@property (retain) NSMutableArray * children;
@property (assign) float rotation;
@property (assign) float scale;
@property (assign) float rotationVelocity;
@property (assign) float scaleVelocity;
@property int health;

- (void)renderWithModelViewMatrix:(GLKMatrix4)modelViewMatrix;
- (void)update:(float)dt;
- (GLKMatrix4) modelMatrix:(BOOL)renderingSelf;
- (CGRect)boundingBox;
- (CGRect)boundingBoxMenuItem;
- (void)addChild:(GameNode *)child;
- (void)handleTap:(CGPoint)touchLocation;

@end
