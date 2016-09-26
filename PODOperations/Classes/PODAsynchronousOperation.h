//
//  PODAsynchronousOperation.h
//  Pods
//
//  Created by Peter Breitling on 26/09/16.
//
//

#import <Foundation/Foundation.h>

#import "PODOperation.h"

@interface PODAsynchronousOperation : PODOperation

// call finished when this operation should end
- (void)finish;

// overwrite the main class that will be call asynchronously
- (void)main;

@end
