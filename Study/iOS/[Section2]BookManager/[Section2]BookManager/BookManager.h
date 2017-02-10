//
//  BookManager.h
//  [Section2]BookManager
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

// Header 부분에는 주로 class를 쓴다.
// 1.컴파일이 빨라진다.
// 2.순환참조 오류를 방지
@class Book;

@interface BookManager : NSObject {
    NSMutableArray *bookList;
}

- (void)addBook:(Book *)bookObject;
- (NSString *)showAllBook;
- (NSInteger *)countBook;
- (NSString *)findBook:(NSString *)name;
- (NSString *)deleteBook:(NSString *)name;

@end
