//
//  TOHeaderViewProtocol.h
//  TONavigationBarExample
//
//  Created by Vasco d'Orey on 26/11/2018.
//  Copyright © 2018 Tim Oliver. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TOHeaderViewProtocol <NSObject>

@property (nonatomic, strong, nullable) UIImage *image;

@property (nonatomic, assign) CGFloat scrollOffset;

@end

NS_ASSUME_NONNULL_END
