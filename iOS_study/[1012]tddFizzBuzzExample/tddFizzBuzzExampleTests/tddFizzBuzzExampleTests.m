//
//  tddFizzBuzzExampleTests.m
//  tddFizzBuzzExampleTests
//
//  Created by celeste on 2016. 10. 12..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface tddFizzBuzzExampleTests : XCTestCase

@end

@implementation tddFizzBuzzExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void) testFaild {
//    XCTAssertEqual(@"1", [self say:1]);
    XCTAssertEqualObjects(@"1", [self say:3]);
}

- (NSString *)say:(NSInteger)num {
    
//    faild 체크
//    return [NSString stringWithFormat:@"%ld",num];
    
    NSString *output = @"";
    for(NSInteger i = 1; i <= 100; i++) {
        if(i % 3 == 0)
            output = [output stringByAppendingString:@"Fizz"];
        
        if(i % 5 == 0)
            output = [output stringByAppendingString:@"Buzz"];
        
        if([output length] == 0)
            output = [NSString stringWithFormat:@"%ld", i];
        
        NSLog(@"%@ : %ld", output, i);
    }
    return output;
}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
