//
//  StackSpec.m
//  ProjectWithCocoapod
//
//  Created by sumantar on 01/11/13.
//  Copyright (c) 2013 sumantar. All rights reserved.
//

#import "Kiwi.h"
#import "Stack.h"

SPEC_BEGIN(StackSpec)
/*
describe(@"Math", ^{
    it(@"Just Sample Test case", ^{
        NSUInteger a = 16;
        NSUInteger b = 26;
        [[theValue(a + b) should] equal:theValue(42)];
    });
});
 */

/*

describe(@"with a stack collection", ^{
    
    context(@"when creating a new collection", ^{
        
        pending(@"the collection should exist", ^{
            
        });
    });
    
    context(@"pushing an object onto the stack", ^{
        
        pending(@"the stack count should be one", ^{
            
        });
        
    });
    
    context(@"popping an object off of the stack", ^{
        
        pending(@"the popped object should be the same as pushed", ^{
            
        });
        
    });
    
    context(@"peeking at the topmost object on the stack", ^{
        
        pending(@"the popped object should be the same as the last pushed", ^{
            
        });
        
        pending(@"the stacks object count should be unaffected by peeking", ^{
            
        });
        
        
    });
    
    context(@"the stack should contain at least 10 concurrent objects", ^{
        
        pending(@"add objects, compare after popping and check stack count", ^{
            
        });
        
    });
    
});
*/

describe(@"with a stack collection", ^{
    
    __block Stack *stack;
    
    beforeEach(^{
        stack = [[Stack alloc] init];
    });
    
    context(@"when creating a new collection", ^{
        
        it(@"the collection should exist", ^{
            [[stack shouldNot] equal:nil];
        });
    });
    
    context(@"pushing an object onto the stack", ^{
        
        it(@"the stack count should be one", ^{
            [stack push:@"First Item"];
            [[stack should] haveCountOf:1];
        });
        
    });
    
    context(@"popping an object off of the stack", ^{
        
        it(@"the popped object should be the same as pushed", ^{
            
            NSString *expectedStackItem = @"First Stack Item";
            
            [stack push: expectedStackItem];
            
            NSString *actualStackItem = (NSString *)[stack pop];
            
            [[expectedStackItem should] equal: actualStackItem];
            
            [[stack should] beEmpty];
        });
        
    });
    
    context(@"peeking at the topmost object on the stack", ^{
        
        __block NSString *expectedStackItem;
        
        beforeEach(^{
            
            expectedStackItem = @"Top most Stack Item";
            
            [stack push:expectedStackItem];
            
        });
        
        it(@"the popped object should be the same as the last pushed", ^{
            
            NSString *actualStackItem = (NSString *)[stack top];
            
            [[expectedStackItem should] equal: actualStackItem];
        });
        
        it(@"the stacks object count should be unaffected by peeking", ^{
            int size = [stack count];
            [stack top];
            [[stack should] haveCountOf: size];
        });
        
        
    });
    
    context(@"the stack should contain at least 10 concurrent objects", ^{
        
        const NSUInteger minimumItemCount = 10;
        const NSString *itemFormat = @"Item %d";
        
        beforeAll(^{
            stack = [[Stack alloc] init];
        });
        
        it(@"add minimum number of objects to the stack", ^{
            
            for(NSUInteger itemCount = 0 ; itemCount < minimumItemCount ; itemCount++) {
                
                [stack push: [NSString stringWithFormat:(NSString *)itemFormat, itemCount]];
                
            }
            
            [[stack should] haveCountOf: minimumItemCount];
            
        });
        
        it(@"pop items from the stack", ^{
            
            NSString *objectFromStack;
            NSUInteger itemCount = minimumItemCount;
            
            while ((objectFromStack = [stack pop]) != nil) {
                itemCount--;
                
                NSString *expectedObject = [NSString stringWithFormat:(NSString *)itemFormat, itemCount];
                
                [[expectedObject should] equal: objectFromStack];
            }   
        });
        
        it(@"stack should be empty", ^{
            
            [[stack should] beEmpty];
            
        }); 
    });
});

SPEC_END