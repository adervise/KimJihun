//
//  Musician.h
//  [1108]PropertAttributes
//
//  Created by celeste on 2016. 11. 8..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Musician : NSObject

@property (nonnull, readonly) NSString *groupName;
@property (null_resettable) NSNumber *memberCount;
@property (nullable, getter=companyName) NSString *company;
@property (null_unspecified) NSString *manager;
@property NSNumber *test;
@property NSMutableDictionary *grouptInfo;

- (instancetype _Nonnull)initWithName:(NSString * _Nonnull)name
                memberCount :(NSNumber * _Nonnull)memberCount;

@end
