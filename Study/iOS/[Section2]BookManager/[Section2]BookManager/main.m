//
//  main.m
//  [Section2]BookManager
//
//  Created by celeste on 2016. 11. 2..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "BookManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Book *book1 = [[Book alloc] init];
        book1.name = @"햄릿";
        book1.genre = @"비극";
        book1.author = @"셰익스피어";
        //[book1 bookPrint];
        
        Book *book2 = [[Book alloc] init];
        book2.name = @"그릿";
        book2.genre = @"인문";
        book2.author = @"앤절라 더크워스";
        //[book2 bookPrint];
        
        Book *book3 = [[Book alloc] init];
        book3.name = @"스타워즈";
        book3.genre = @"영화";
        book3.author = @"스필버그";
        //[book3 bookPrint];
        
        BookManager *myBook = [[BookManager alloc] init];
        [myBook addBook:book1];
        [myBook addBook:book2];
        [myBook addBook:book3];
        
        NSLog(@"%@",[myBook showAllBook]);
        NSLog(@"Count : %ld", [myBook countBook]);
        
        NSString *stringTemp = [myBook findBook:@"햄릿"];
        if (stringTemp != nil) {
            NSLog(@"책 찾기 결과 입니다 *** %@",stringTemp);
        } else {
            NSLog(@"찾으시는 책이 없습니다.");
        }
        
        NSString *removeResult = [myBook deleteBook:@"그릿"];
        if (removeResult != nil) {
            NSLog(@"%@ 책을 지웠습니다",removeResult);
        } else {
            NSLog(@"지우려는 책이 없습니다.");
        }
        
        NSLog(@"After showAllBook %@", [myBook showAllBook]);
        NSLog(@"After countBook : %ld", [myBook countBook]);
    }
    return 0;
}
