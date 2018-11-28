//
//  TOHeaderStackView.m
//  TONavigationBarExample
//
//  Created by Vasco d'Orey on 22/11/2018.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import "TOHeaderStackView.h"

@interface TOFixedWidthImageView : UIImageView

@property (nonatomic) CGFloat targetWidth;

@end

@implementation TOFixedWidthImageView

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    
    CGSize targetSize = CGSizeMake(self.targetWidth, size.height / (size.width / self.targetWidth));
    
    return targetSize;
}

@end

@interface TOHeaderStackView ()

@property (nonatomic, strong, readwrite) UIStackView *stackView;

@property (nonatomic, strong) TOFixedWidthImageView *imageView;

@property (nonatomic, strong) NSLayoutConstraint *stackViewTopConstraint;

@property (nonatomic, strong) NSLayoutConstraint *stackViewBottomConstraint;

@end

@implementation TOHeaderStackView

- (instancetype)init {
    self = [super initWithFrame:CGRectZero];
    if(!self) {
        return nil;
    }
    
    self.backgroundColor = UIColor.blackColor;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self setupViews];
    
    [self setupConstraints];
    
    return self;
}

- (void)setupViews {
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:@[]];
    self.stackView.translatesAutoresizingMaskIntoConstraints = NO;
    self.stackView.axis = UILayoutConstraintAxisVertical;
    [self addSubview:self.stackView];
    
    self.imageView = [[TOFixedWidthImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.stackView addArrangedSubview:self.imageView];
}

- (void)setupConstraints {
    self.stackViewTopConstraint = [self.stackView.topAnchor constraintEqualToAnchor:self.topAnchor];
    self.stackViewTopConstraint.active = YES;
    
    [self.stackView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
    [self.stackView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
    
    self.stackViewBottomConstraint = [self.stackView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    self.stackViewBottomConstraint.active = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setImage:(UIImage *)image {
    if (image == _image) {
        return;
    }
    
    _image = image;
    
    self.imageView.image = image;
}

- (void)prepareForLayoutFitting:(CGFloat)targetWidth {
    self.imageView.targetWidth = targetWidth;
    
    [self.imageView invalidateIntrinsicContentSize];
}

@end
