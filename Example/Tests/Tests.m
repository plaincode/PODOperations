//
//  PODOperationsTests.m
//  PODOperationsTests
//
//  Created by Peter Breitling on 09/26/2016.
//  Copyright (c) 2016 Peter Breitling. All rights reserved.
//

@import XCTest;

#import "PODSynchronousOperationExample.h"
#import "PODAsynchronousOperationExample.h"

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    PODSynchronousOperationExample *synchronousOperation = [PODSynchronousOperationExample new];
    [synchronousOperation setCompletionBlock:^{
        NSLog(@"SynchronousOperation completed");
    }];
    [operationQueue addOperation:synchronousOperation];
    PODAsynchronousOperationExample *asynchronousOperation = [PODAsynchronousOperationExample new];
    [asynchronousOperation addDependency:synchronousOperation];
    [asynchronousOperation setCompletionBlock:^{
        NSLog(@"AsynchronousOperation completed");
    }];
    [operationQueue addOperation:asynchronousOperation];
    [asynchronousOperation waitUntilFinished];
}

@end

