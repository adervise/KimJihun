//
//  Person.h
//  StructureExample
//
//  Created by celeste on 2016. 9. 19..
//  Copyright © 2016년 iosSchool. All rights reserved.
//


// framework 에서 지원하는 function import
#import <Foundation/Foundation.h>

@interface Person : NSObject

// property 정의 -> @property <dataType> <propertyName> ;
// interface ~ end 사이에 참조 될 만한 내용을 추가한다.
@property id name;
@property id blood;
@property id height;
@property id weight;
@property id nationality;

// - (<returnTpe>)methodName;
- (id)methodName;
- (id)listen;
- (id)speak;
- (id)eat;
- (id)think;
- (id)walk;

@end
