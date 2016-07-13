//
//  BrightDayTests.m
//  BrightDayTests
//
//  Created by David Beleza on 12/07/16.
//  Copyright © 2016 David Beleza. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewModel.h"

@interface BrightDayTests : XCTestCase

@property (nonatomic,strong) ViewModel *viewModel;

@end

@implementation BrightDayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _viewModel = [[ViewModel alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testViewModel {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSDate *dateTest = [NSDate dateWithTimeIntervalSince1970:60*60*24*1];
    
    ViewModel *viewModel = [[ViewModel alloc] init];
    
    XCTestExpectation *expectation = [self expectationWithDescription:@"wait block answer"];
    [viewModel getNextLotteryDateFromDate:dateTest afterCompletion:^(NSString *date) {
        
        XCTAssertTrue([date isEqualToString:@"03/01/1970 - 08PM"], "DATES NOT EQUAL!!!");
        
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        
        if (error != nil) {
            
            NSLog(@"Error: %@", error.localizedDescription);
            
        }
    }];
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
