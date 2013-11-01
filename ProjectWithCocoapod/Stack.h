//
//  Stack.h
//  StackApplication
//
//  Created by Sumanta Rout on 6/29/10.
//  Copyright 2010 Cybage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject {
	
    @private
	NSMutableArray *stackArray;	
}

+(Stack *)sharedInstance;
-(void) push:(id)object;
-(id) pop;

@end
