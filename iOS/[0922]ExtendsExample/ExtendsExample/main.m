//
//  main.m
//  ExtendsExample
//
//  Created by celeste on 2016. 9. 22..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Warrior.h"
#import "Wizard.h"

#import "Person.h"
#import "Teacher.h"
#import "Student.h"
#import "UniversityStudent.h"
#import "GameCharecter.h"
#import "Animal.h"
#import "Cat.h"

int main(int argc, const char * argv[]) {

    Warrior *jack = [[Warrior alloc] init];
    jack.name = @"전사";
    jack.health = 1000;
    jack.physicalPower = 130;
    
    Wizard *bini = [[Wizard alloc] init];
    bini.name = @"마법사";
    bini.health = 1500;
    bini.magicalPower = 200;
    
    [jack physicalAttackT:bini.name];
    [jack physicalAttackTo:bini];
    [jack physicalAttackToo:@"test"];
    
    [bini magicalAttactoTo:jack.name giveDamage: 100];
    
    Teacher *teacher = [[Teacher alloc] init];
    teacher.name = @"박혜미";
    teacher.subject = @"유아교육";
    
    Student *studen1 =[[Student alloc] init];
    studen1.name = @"김지훈";
    
    Student *studen2 =[[Student alloc] init];
    studen2.name = @"나무늘보";

    [teacher teach:studen1];
    [teacher teach:studen2];

    UniversityStudent *uniStudent = [[UniversityStudent alloc] init];
    uniStudent.name = @"대학생김지훈";
    
    [teacher teach:uniStudent];
    
    Person *person = [[Person alloc] init];
    person.name = @"김지훈";
    
    GameCharecter *charecter = [[GameCharecter alloc] init];
    charecter.charecterClass = @"바바리안";
    
    [person select:charecter];
    [studen1 select:charecter];
    
    Animal *animal =[[Animal alloc] init];
    animal.name = @"고양이";
    animal.cry = @"야옹야옹";
    [animal cryTo:person];

    Cat *cat = [[Cat alloc] init];
    cat.name = @"냐옹이";
    cat.cry = @"으르렁으르렁";
    [cat cryTo:person];

    return 0;
}
