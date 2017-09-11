//
//  main.m
//  [1108]PropertAttributes
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Musician.h"
#import "BroadcastStation.h"

int main(int argc, const char * argv[]) {
    
    
    __strong Musician *blackPink = [[Musician alloc] initWithName:@"블랙핑크"
                                        memberCount:@4];
    
//    __weak Musician *weakBlack = blackPink;
    
    blackPink.grouptInfo = [NSMutableDictionary dictionary];
    [blackPink.grouptInfo setObject:@"YG" forKey:@"소속사"];
    
    Musician *bigbang = [[Musician alloc] initWithName:@"빅뱅"
                                      memberCount:@4];
    
    
    
    
    NSLog(@"retain count 1 : %ld :",blackPink.retainCount);

    [blackPink retain];

    NSLog(@"retain count 2 : %ld :",blackPink.retainCount);

    [blackPink release];

    NSLog(@"retain count 3 : %ld :",blackPink.retainCount);

    [blackPink release];
    
    NSLog(@"retain count 4 : %ld :",blackPink.retainCount);
    
    BroadcastStation *mbc = [[BroadcastStation alloc] init];
    BroadcastStation *sbs = [[BroadcastStation alloc] init];
    BroadcastStation *jtbc = [[BroadcastStation alloc] init];

    
    
    mbc.musician = blackPink;
    [blackPink retain];
    
    sbs.musician = blackPink;
    [blackPink retain];

    jtbc.musician = blackPink;

    mbc.musician = nil;
    [blackPink release];
    
    sbs.musician = nil;
    [blackPink release];
    
    NSLog(@"%@", jtbc.musician.groupName);
    
    
//    blackPink.company = @"YH";
//    NSLog(@"%@", blackPink.groupName);
//    NSLog(@"%@", blackPink.company);
//    NSLog(@"%@", blackPink.memberCount);
//
//    
//    blackPink.memberCount = @5;
//    blackPink.manager = @"정준화";
//    [blackPink setManager:@"w정전훼"];
//    
//    blackPink.manager = nil;
    
    return 0;
}
