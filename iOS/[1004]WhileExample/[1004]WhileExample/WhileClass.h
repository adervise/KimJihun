//
//  WhileClass.h
//  [1004]WhileExample
//
//  Created by celeste on 2016. 10. 4..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WhileClass : NSObject

/*! @brief 넘겨 받는 숫자  */
@property NSInteger num;

/*!
 * @discussion 구구단
 * @param num 넘겨 받는 숫자
 * @return void LOG로 출력
 */
+ (void)whileSupply:(NSInteger)num;
+ (void)forSupply:(NSInteger)num;
+ (void)factorial:(NSInteger)num;
+ (void)triangularNum:(NSInteger)num;
+ (void)addAllNum:(NSInteger)num;
+ (void)game369:(NSInteger)num;


- (NSString *)titleWithData:(NSDictionary *)data;
- (NSArray *)songTitles:(NSDictionary *)data;
- (NSArray *)songDatas:(NSDictionary *)data;
- (NSString *)lyricsSongTitleInput:(NSDictionary *)data;
//- (NSData *)songTime:(NSDictionary *)data;
- (NSArray *)songArray:(NSDictionary *)data;

- (NSDate *)songTime:(NSString *)title data:(NSDictionary *)data;
- (NSString *)lyricsSongTitleInput:(NSString *)title data:(NSDictionary *)data ;





@end
