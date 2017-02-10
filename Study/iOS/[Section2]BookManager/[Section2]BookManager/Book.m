//
//  Book.m
//  [Section2]BookManager
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "Book.h"

@implementation Book
@synthesize name, genre,author;

-(void)bookPrint {
    NSLog(@"NAME : %@", name);
    NSLog(@"NAME : %@", genre);
    NSLog(@"NAME : %@", author);
}


@end
