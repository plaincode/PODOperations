//
//  PODSynchronousOperationExample.m
//  PODOperations
//
//  Created by Peter Breitling on 26/09/16.
//  Copyright © 2016 Peter Breitling. All rights reserved.
//

#import "PODSynchronousOperationExample.h"

@implementation PODSynchronousOperationExample

- (void)main
{
    NSLog(@"Do the work synchronously");
    [NSThread sleepForTimeInterval:2.0];
    NSLog(@"Done");
}

@end
