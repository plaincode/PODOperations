//
//  PODAsynchronousOperation.m
//  Pods
//
//  Created by Peter Breitling on 26/09/16.
//
//

#import "PODAsynchronousOperation.h"

@interface PODAsynchronousOperation ()

@property (atomic) BOOL opFinished;
@property (atomic) BOOL opExecuting;

@end

@implementation PODAsynchronousOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _opExecuting = NO;
        _opFinished = NO;
    }
    return self;
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return self.opExecuting;
}

- (BOOL)isFinished
{
    return self.opFinished;
}

- (void)start
{
    if ([self isCancelled]) {
        
        // Must move the operation to the finished state if it is canceled.
        
        [self willChangeValueForKey:@"isFinished"];
        
        self.opFinished = YES;
        
        [self didChangeValueForKey:@"isFinished"];
        
        return;
    }
    
    // If the operation is not canceled, begin executing the task.
    
    [self willChangeValueForKey:@"isExecuting"];
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    
    self.opExecuting = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    
}

- (void)finish
{
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    
    self.opExecuting = NO;
    self.opFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)main
{
    [self finish];
}

@end
