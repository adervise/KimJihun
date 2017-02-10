//
//  IdolCell.m
//  [1014]CustomViewExample
//
//  Created by celeste on 2016. 10. 14..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "IdolCell.h"

@interface IdolCell()


@property UIImageView *backgroundImage;
@property UIView *coverView;
@property UILabel *titleLb;


@end


@implementation IdolCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"in layoutSubViews %f",self.frame.size.height);
    [self updateLayout];
}

- (void)createView {
    
    self.backgroundImage = [[UIImageView alloc] init];
    self.backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImage.clipsToBounds = YES;
    [self.contentView addSubview:self.backgroundImage];
    
    self.coverView = [[UIView alloc] init];
    self.coverView.backgroundColor = [UIColor colorWithRed:30.f/255.f green:30.f/255.f blue:30.f/255.f alpha:0.5];
    [self.backgroundImage addSubview:self.coverView];
    
    self.titleLb = [[UILabel alloc] init];
    self.titleLb.font = [UIFont boldSystemFontOfSize:40];
    self.titleLb.textAlignment = NSTextAlignmentCenter;
    self.titleLb.textColor = [UIColor whiteColor];
    [self.coverView addSubview:self.titleLb];
}

- (void)updateLayout {

    self.backgroundImage.frame = self.bounds;
    self.coverView.frame = CGRectMake(10, 10, self.backgroundImage.frame.size.width - 20, self.backgroundImage.frame.size.height - 20);
    self.titleLb.frame = CGRectMake(0, 20, self.coverView.frame.size.width, self.coverView.frame.size.height - 40);
}

//백그라운드 이미지 설정
- (void)setBackgroundImageName:(NSString *)name {

    self.backgroundImage.image = [UIImage imageNamed:name];
}

- (void)setTitle:(NSString *)title {
    self.titleLb.text = title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
