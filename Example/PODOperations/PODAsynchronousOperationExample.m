//
//  PODAsynchronousOperationExample.m
//  PODOperations
//
//  Created by Peter Breitling on 26/09/16.
//  Copyright © 2016 Peter Breitling. All rights reserved.
//

#import "PODAsynchronousOperationExample.h"

@implementation PODAsynchronousOperationExample

- (BOOL)isConcurrent
{
    return YES;
}

- (void)main
{
    NSLog(@"Do the work asynchronously");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        NSLog(@"Done");
        [self finish];
    });
}

@end
