//
// Created by Daniel on 27/05/15.
// Copyright © 2015 Daniel. All rights reserved.
//

@import Foundation;
@import UIKit;


/// Daniel set of branding colours
typedef NS_ENUM(NSUInteger, TTLColorType) {
    TTLColorTypeMint = 1,
    TTLColorTypeCoral,
    TTLColorTypeNavy,
    TTLColorTypeWhite,
    TTLColorTypeGrey4,
    TTLColorTypeGrey8,
    TTLColorTypeGrey12,
    TTLColorTypeGrey30,
    TTLColorTypeGrey54,
    TTLColorTypeGrey80,
    TTLColorTypeBlack
};

@interface UIColor (TTLColorType)

+ (UIColor *)colorWithType:(TTLColorType)type;

@end
