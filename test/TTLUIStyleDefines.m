//
// Created by Andrey Kozlov on 27/05/15.
// Copyright © 2015 Daniel. All rights reserved.
//

#import "TTLUIStyleDefines.h"

@implementation UIColor (TTLColorType)

+ (UIColor *)colorWithType:(TTLColorType)type
{
    switch (type) {
        case TTLColorTypeMint:
            return [UIColor ttl_colorWithRed:72.0f green:213.0f blue:181.0f alpha:1.0f];
            
        case TTLColorTypeCoral:
            return [UIColor ttl_colorWithRed:255.0f green:88.0f blue:95.0f alpha:1.0f];
            
        case TTLColorTypeNavy:
            return [UIColor ttl_colorWithRed:33.0f green:49.0f blue:77.0f alpha:1.0f];
            
        case TTLColorTypeWhite:
            return [UIColor whiteColor];
            
        case TTLColorTypeGrey4:
            return [UIColor ttl_colorWithBlack:0.04f alpha:1.0f];
            
        case TTLColorTypeGrey8:
            return [UIColor ttl_colorWithBlack:0.08f alpha:1.0f];
            
        case TTLColorTypeGrey12:
            return [UIColor ttl_colorWithBlack:0.12f alpha:1.0f];
            
        case TTLColorTypeGrey30:
            return [UIColor ttl_colorWithBlack:0.3f alpha:1.0f];
            
        case TTLColorTypeGrey54:
            return [UIColor ttl_colorWithBlack:0.54f alpha:1.0f];
            
        case TTLColorTypeGrey80:
            return [UIColor ttl_colorWithBlack:0.8f alpha:1.0f];
            
        case TTLColorTypeBlack:
            return [UIColor blackColor];
            
        default:
            return [UIColor colorWithType:TTLColorTypeWhite];
    }
}

+ (UIColor *)ttl_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
}

+ (UIColor *)ttl_colorWithBlack:(CGFloat)black alpha:(CGFloat)alpha
{
    return [UIColor colorWithWhite:1.0f - black alpha:alpha];
}

@end
