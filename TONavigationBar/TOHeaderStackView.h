//
//  TOHeaderStackView.h
//  TONavigationBarExample
//
//  Created by Vasco d'Orey on 22/11/2018.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOHeaderViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface TOHeaderStackView : UIView <TOHeaderViewProtocol>

@property (nonatomic, strong, readonly) UIStackView *stackView;

@property (nonatomic, strong, nullable) UIImage *image;

@property (nonatomic, assign) CGFloat scrollOffset;

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

- (void)prepareForLayoutFitting:(CGFloat)targetWidth;

@end

NS_ASSUME_NONNULL_END
