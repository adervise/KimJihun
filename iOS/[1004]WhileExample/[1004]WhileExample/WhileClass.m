//
//  WhileClass.m
//  [1004]WhileExample
//
//  Created by celeste on 2016. 10. 4..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "WhileClass.h"

@implementation WhileClass


+ (void)whileSupply:(NSInteger)num {
    
    NSInteger index = 1;
    while (index < 10) {
        NSLog(@"%ld * %ld = %ld", num, index, num * index);
        index++;
    }
    NSLog(@"*** while *** 구구단이 끝났습니다.");
}


+ (void)forSupply:(NSInteger)num {
    
    for (NSInteger i=1; i<10; i++) {
        NSLog(@"%ld * %ld = %ld", num, i, num * i);
    }
    NSLog(@"*** for *** 구구단이 끝났습니다.");

    
}


+ (void)factorial:(NSInteger)num {
    
    NSInteger factorial=1;
    for (NSInteger i = 1; i<=num; i++) {
        factorial *= i;
    }
    NSLog(@"factorial = %ld",factorial);
    NSLog(@"*** factorial *** 끝났습니다.");
}


+ (void)triangularNum:(NSInteger)num {
    
    NSInteger triangularNumber = 0;
    for (NSUInteger i=1; i<=num; i++) {
        triangularNumber += i;
    }
    NSLog(@"triangularNum : %ld", triangularNumber );
    NSLog(@"*** triangularNum *** 끝났습니다.");
}


+ (void)addAllNum:(NSInteger)num {
    
    NSInteger sum = 0;
    NSInteger x = 0;
            
    while (num > 0) {
        x = num - (NSInteger)(num*0.1f) * 10;
        NSLog(@"*********");
        NSLog(@"%ld",(NSInteger)(num*0.1f));

        sum += x;
        num *= 0.1f;
    }
     NSLog(@"addAllNum : %ld", sum );
}

+ (void)game369:(NSInteger)num{

    for (NSInteger i = 1; i <= num; i++) {
        BOOL is369 = NO;
        for (NSInteger j = i; j != 0 ; j /= 10) {
            if (j%10 == 3 || j%10 == 6 || j%10 == 9)
                is369 = YES;
        }
        
        if (is369) printf("*,");
        else printf("%ld,", i);
    }
}



- (NSString *)titleWithData:(NSDictionary *)data {
    

    
    if (data != NULL) {
        NSDictionary *album_info = [data objectForKey:@"album_info"];
        NSString *title = [album_info objectForKey:@"title"];
        return title;
    }
    return nil;
}

- (NSArray *)songTitles:(NSDictionary *)data {
    
    if (data != NULL) {

        NSMutableArray *songs = [[NSMutableArray alloc] init];
        NSArray *songTitles = [data objectForKey:@"song_list"];
        for (NSDictionary *song in songTitles) {
            [songs addObject:[song objectForKey:@"name"]];
        }
        return songs;
    }
    return nil;
}

+ (NSDate *)songTime:(NSString *)title data:(NSDictionary *)data{
    
    NSArray *song_list = [data objectForKey:@"song_list"];
    NSDate *totalPlay;
    
    for(NSMutableDictionary *songName in song_list){
        if([title isEqualToString:[songName objectForKey:@"name"]]){
            totalPlay = [songName objectForKey:@"total_play_time"];
        }
    }
    return totalPlay;
}

//노래제목으로 재생시간
- (NSDate *)songTime:(NSString *)title data:(NSDictionary *)data {
    
    NSArray *song_list = [data objectForKey:@"song_list"];
    NSDate *totalPlay;
    
    for(NSMutableDictionary *songName in song_list){
        if([title isEqualToString:[songName objectForKey:@"name"]]){
            totalPlay = [songName objectForKey:@"total_play_time"];
        }
    }
    return totalPlay;
}

- (NSString *)lyricsSongTitleInput:(NSString *)title data:(NSDictionary *)data {
    
    NSArray *song_list = [data objectForKey:@"song_list"];
    NSMutableDictionary *thisSong = [[NSMutableDictionary alloc]init];
    
    for(NSMutableDictionary *songName in song_list){
        if([title isEqualToString:[songName objectForKey:@"name"]]){
            thisSong = [songName objectForKey:@"song_info"];
        }
    }
    
    NSString *lyrics = [thisSong objectForKey:@"lyrics"];
    return lyrics;
}

@end
