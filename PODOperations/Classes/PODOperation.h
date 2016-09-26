//
//  PODOperation.h
//  Pods
//
//  Created by Peter Breitling on 26/09/16.
//
//

#import <Foundation/Foundation.h>

@interface PODOperation : NSOperation

// Used to signal an error if not nil after operation is completed
@property (nonatomic) NSError *error;

// Overwrite isConcurrent method to return YES for asynchronous operations
- (BOOL)isConcurrent;

// Always overwrite main method for synchronous and asynchronous operations
- (void)main;

// call finished when this operation should end - just use for asynchronous operation (your isConcurent returns YES)
- (void)finish;

@end
