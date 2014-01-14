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
    
}


@end
