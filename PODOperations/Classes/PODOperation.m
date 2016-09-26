//
//  PODOperation.m
//  Pods
//
//  Created by Peter Breitling on 26/09/16.
//
//

#import "PODOperation.h"

@interface PODOperation ()

@property (atomic) BOOL opFinished;
@property (atomic) BOOL opExecuting;

@end

@implementation PODOperation

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
    return NO;
}

- (BOOL)isExecuting
{
    if (!self.isConcurrent) return [super isExecuting];
    return self.opExecuting;
}

- (BOOL)isFinished
{
    if (!self.isConcurrent) return [super isFinished];
    return self.opFinished;
}

- (void)start
{
    if (!self.isConcurrent) { [super start]; return; };
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
    NSAssert(self.isConcurrent, NSLocalizedString(@"Finish may only be called on asynchronous operations", nil));

    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    
    self.opExecuting = NO;
    self.opFinished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (void)main
{
    if (!self.isConcurrent) { [super main]; return; };
    NSAssert(!self.isConcurrent, NSLocalizedString(@"This main implementation must not be called in asynchronous mode, use finish from you own main implementation", nil));
    [self finish];
}

@end
