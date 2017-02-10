//
//  BookManager.m
//  [Section2]BookManager
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "BookManager.h"
#import "Book.h"

@implementation BookManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        bookList = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addBook:(Book *)bookObject {
    [bookList addObject:bookObject];
}


- (NSString *)showAllBook {
    NSMutableString *stringTemp = [[NSMutableString alloc] init];
    for (Book *bookTemp in bookList) {
        [stringTemp appendString:@"Name : "];
        [stringTemp appendString:bookTemp.name];
        [stringTemp appendString:@"\n"];
        [stringTemp appendString:@"Genre : "];
        [stringTemp appendString:bookTemp.genre];
        [stringTemp appendString:@"\n"];
        [stringTemp appendString:@"Author : "];
        [stringTemp appendString:bookTemp.author];
        [stringTemp appendString:@"\n"];
        [stringTemp appendString:@"-----------"];
        [stringTemp appendString:@"\n"];
    }
    return stringTemp;
}


- (NSInteger *)countBook {
    return [bookList count];
}


- (NSString *)findBook:(NSString *)name {
    NSMutableString *stringTemp = [[NSMutableString alloc] init];
    for (Book *bookTemp in bookList) {
        if ([bookTemp.name isEqualToString:name]) {
            [stringTemp appendString:@"Name : "];
            [stringTemp appendString:bookTemp.name];
            [stringTemp appendString:@"\n"];
            [stringTemp appendString:@"Genre : "];
            [stringTemp appendString:bookTemp.genre];
            [stringTemp appendString:@"\n"];
            [stringTemp appendString:@"Author : "];
            [stringTemp appendString:bookTemp.author];
            return stringTemp;
        }
    }
    return nil;
}


-(NSString *)deleteBook:(NSString *)name {
    for (Book *bookTemp in bookList) {
        if ([bookTemp.name isEqualToString:name]) {
            [bookList removeObject:bookTemp];
            return name;
        }
    }
    return nil;
}


@end
