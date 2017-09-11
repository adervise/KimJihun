//
//  main.m
//  [1004]WhileExample
//
//  Created by celeste on 2016. 10. 4..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WhileClass.h"

int main(int argc, const char * argv[]) {
    
    
    [WhileClass whileSupply:3];
    [WhileClass forSupply:4];
    [WhileClass factorial:5];
    [WhileClass triangularNum:11];
    [WhileClass addAllNum:162];
    [WhileClass game369:39];
    
    WhileClass *data = [[WhileClass alloc] init];
    //메소드 실행
    NSDictionary *aoaAlbum = @{@"album_info":@{@"title": @"Heart Attack",@"artist" : @"AOA",}, @"song_list" : @[@{@"name":@"심쿵해", @"artist":@"AOA", @"total_play_time":
                                                                                                                    @223,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"Mr.강",@"lyrics":@"완전 반해 반해 버렸어요\n부드러운 목소리에\n반해 반해 버렸어요\n난 떨려\n(AOA Let's Go!)"}},@{@"name":@"Luv Me", @"artist":@"AOA", @"total_play_time": @252,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"JS",@"lyrics":@"Do it this do it this girl\nDo it this do it this hey\nDo it this do it this girl\n "}},@{@"name":@"한개", @"artist":@"AOA", @"total_play_time": @238,@"song_info":@{@"writer":@"용감한 형제들",@"composer":@"별들의 전쟁",@"lyrics":@"딱 하루만 더 내게 시간을 줘\n우리 내일 다시 헤어지자고\n너와 끼던 반지 한 개 아무 의미 없이 남아\n우린 아니라는 말에 세상이 끝나버릴 것만 같아\n "}}],@"producer":@"FNC엔터테인먼트",@"album_story":@"AOA 3rd Mini Album [Heart Attack] Information\n\nAOA, 이번엔 ‘섹시 스포티’다! 세 번째 미니 앨범 ‘Heart Attack’ 전격 발매\n\nAOA, 무더위 날려 버릴 상큼발랄 서머송 ‘심쿵해’로 7개월 만의 컴백\n\n"};
    
    NSString *aoaAlbumTitle = [data titleWithData:aoaAlbum];
    NSLog(@"%@",aoaAlbumTitle);
    
    // 노래타이틀
    NSArray *songTitles = [data songTitles:aoaAlbum];
    NSLog(@"%@",songTitles);
    
    //노래제목들 출력
    for (NSString *songListName in [data songTitles:aoaAlbum])
        NSLog(@"Song Titles: %@", songListName);
    
    //노래제목으로 재생시간출력
    NSLog(@"%@",[data lyricsSongTitleInput:@"심쿵해" data:aoaAlbum]);
    
    //노래제목으로 재생시간출력
    NSLog(@"%@",[data songTime:@"심쿵해" data:aoaAlbum]);


    return 0;
}
