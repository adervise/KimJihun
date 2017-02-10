//
//  Musician.m
//  [1108]PropertAttributes
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Musician.h"



@implementation Musician
//@synthesinonatomicze company, groupName, memberCount, manager;

- (void)setMemberCount:(NSNumber *)memberCount {
    if (memberCount) {
        _memberCount = memberCount;
    } else {
        _memberCount = @0;
    }
}


- (void)dealloc {
    NSLog(@"%@ dealloc",self.groupName);
    [super dealloc];
}


- (nonnull instancetype)init {
    self = [super init];
    if (self) {
        self.memberCount = @0;
    }
    return self;
}


- (void)setGroupName:(NSString * _Nonnull)groupName {
    _groupName = groupName;
}


- (instancetype)initWithName:(NSString * _Nonnull)name
              memberCount:(NSNumber * _Nonnull)memberCount {
    
    self = [super init];
    if (self) {
        _groupName = name;
        _memberCount = memberCount;
    }
    return self;
}

@end
