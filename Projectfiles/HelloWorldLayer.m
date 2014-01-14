/*
 * Kobold2D™ --- http://www.kobold2d.org
 *
 * Copyright (c) 2010-2011 Steffen Itterheim. 
 * Released under MIT License in Germany (LICENSE-Kobold2D.txt).
 */

#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

CCSprite* ship1;
CCSprite* ship2;

@interface HelloWorldLayer (PrivateMethods)
@end

@implementation HelloWorldLayer

@synthesize helloWorldString, helloWorldFontName;
@synthesize helloWorldFontSize;

-(id) init
{
	if ((self = [super init]))
	{
        ship1 = [CCSprite spriteWithFile: @"ship.png"];
        ship1.position = ccp(50, 200);
        
        ship2 = [CCSprite spriteWithFile: @"ship.png"];
        ship2.position = ccp(100, 50);
        
        [self addChild:ship1];
        [self addChild:ship2];
        
        [self scheduleUpdate];
	}

	return self;
}

-(void) update:(ccTime)dt
{
    
    ship1.position = ccp(ship1.position.x + 100 * dt, ship1.position.y);
    
    if (ship1.position.x > 480 + 32) {
        ship1.position = ccp(-32, ship1.position.y);
    }
    
    // Create instance of Input of Kobolds touch processor
    
    KKInput* input = [KKInput sharedInput];
    
    // Create a point, by asking input manager where touch was registered
    CGPoint pos = [input locationOfAnyTouchInPhase:KKTouchPhaseBegan];
    
    // Input will return 0,0 if no touch has been registered
    
    if (pos.x != 0 && pos.y != 0) {
        
        [ship2 runAction: [CCMoveTo actionWithDuration:0.5 position:pos]];
        
    }
    
}


@end
