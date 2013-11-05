//
//  Stack.m
//  StackApplication
//
//  Created by Sumanta Rout on 6/29/10.
//  Copyright 2010 Cybage. All rights reserved.
//

#import "Stack.h"


@implementation Stack

static Stack *sharedObject = nil;

- (id) init
{	
	if( self = [super init] )
	{
		stackArray = [[NSMutableArray alloc] init];
	}
	return self;
}

+(Stack *)sharedInstance
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;

}

-(void) push:(id)object
{
	[stackArray addObject:object];
}

-(id) pop
{
	if([stackArray count] >0)
	{		
		id object = [stackArray lastObject];
		[stackArray removeLastObject];
		return object;
	}
	return nil;
}

-(id) top
{
    if([stackArray count] >0)
	{
		id object = [stackArray lastObject];
		return object;
	}
	return nil;
}
-(int)count
{
    return [stackArray count];
}

@end
