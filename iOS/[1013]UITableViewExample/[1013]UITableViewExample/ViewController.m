//
//  ViewController.m
//  [1013]UITableViewExample
//
//  Created by celeste on 2016. 10. 13..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>


@property NSArray *animalName;

@property UITableView *tableView;
@property BOOL isEditing;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.isEditing = NO;
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(onClickEditButton:)];
    [self.navigationItem setRightBarButtonItem:editButton];
    
    // 이미지 이름, 제목, 상세설명 배열 형태로 저장
    self.animalName = @[@{@"name":@"bear",@"image":@"bear",@"descript":@"This is Bear",@"switchCell":@0},
                        @{@"name":@"buffalo",@"image":@"buffalo",@"descript":@"This is Bear",@"switchCell":@0},
                        @{@"name":@"cockatoo",@"image":@"cockatoo",@"descript":@"This is Bear",@"switchCell":@0},
                        @{@"name":@"duck",@"image":@"duck",@"descript":@"This is Bear"},
                        @{@"name":@"donkey",@"image":@"donkey",@"descript":@"This is Bear"},
                        @{@"name":@"emu",@"image":@"emu",@"descript":@"This is Bear"},
                        @{@"name":@"horse",@"image":@"horse",@"descript":@"This is Bear"},
                        @{@"name":@"lion",@"image":@"lion",@"descript":@"This is Bear"},
                        @{@"name":@"giraffe",@"image":@"giraffe",@"descript":@"This is Bear"},
                        @{@"name":@"koala",@"image":@"koala",@"descript":@"This is Bear"},
                        @{@"name":@"manatus",@"image":@"manatus",@"descript":@"This is Bear"},
                        @{@"name":@"panda",@"image":@"panda",@"descript":@"This is Bear"},
                        @{@"name":@"elephant",@"image":@"elephant",@"descript":@"This is Bear"},
                        @{@"name":@"meerkat",@"image":@"meerkat",@"descript":@"This is Bear"},
                        @{@"name":@"peacock",@"image":@"peacock",@"descript":@"This is Bear"},
                        @{@"name":@"whale",@"image":@"whale",@"descript":@"This is Bear"},
                        @{@"name":@"wombat",@"image":@"wombat",@"descript":@"This is Bear"},
                        @{@"name":@"pig",@"image":@"pig",@"descript":@"This is Bear"},
                        @{@"name":@"platypus",@"image":@"platypus",@"descript":@"This is Bear"}];

    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(-15, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)onClickEditButton:(UIBarButtonItem *)item {
    
    if (!self.isEditing) {
        [self.tableView setEditing:YES animated:YES];
        self.isEditing = YES;
    } else {
        [self.tableView setEditing:NO animated:YES];
        self.isEditing = NO;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section+1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animalName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *item = [self.animalName objectAtIndex:indexPath.row];
    UITableViewCell *cell;
    if ([item objectForKey:@"switchCell"] != nil) {
                cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
        UISwitch *rolex;
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"switchCell"];
            rolex = [[UISwitch alloc] initWithFrame:CGRectMake(100, 100, 1000, 1000)];
            rolex.tag = indexPath.section;
            cell.accessoryView = rolex;
            BOOL  isSwitch = [[item objectForKey:@"isSwitch"] boolValue];
            
        }
    }

    cell.textLabel.text = [item objectForKey:@"name"];
    cell.detailTextLabel.text = [item objectForKey:@"descript"];
    NSString *path = [[NSBundle mainBundle] pathForResource:[item objectForKey:@"image"] ofType:@"jpg"];
    UIImage *theImage = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = theImage;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
    NSDictionary *animal = [self.animalName objectAtIndex:indexPath.row];
    NSString *name = [animal objectForKey:@"name"];
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"My Title"
                                  message:[NSString stringWithFormat:@"%@",name]
                                  preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleCancel
                         handler:^(UIAlertAction * action) {
                                    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
                                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                                }];
    [alert addAction:ok];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TEST");
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
