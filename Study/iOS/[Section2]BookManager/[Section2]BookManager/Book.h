//
//  Book.h
//  [Section2]BookManager
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, strong) NSString *name, *genre, *author;

- (void)bookPrint;

@end
