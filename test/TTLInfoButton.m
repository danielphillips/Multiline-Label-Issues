//
//  TTLInfoButton.m
//  Daniel
//
//  Created by Daniel on 08/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import "TTLInfoButton.h"
#import "TTLUIStyleDefines.h"

@implementation TTLInfoButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.accessibilityLabel = @"More information";
    self.tintColor = [UIColor colorWithType:TTLColorTypeGrey54];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [self setImage:[UIImage imageNamed:@"blue-ring-i"] forState:UIControlStateNormal];
}

- (void)updateConstraints
{
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:19];
    height.identifier = @"Info Button Height";
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1 constant:19];
    width.identifier = @"Info Button Width";
    
    [self addConstraints:@[ width, height ]];
    
    [super updateConstraints];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    const static CGFloat minimumSide = 44.0f;
    CGFloat differenceY = minimumSide - self.bounds.size.height;
    CGFloat differenceX = minimumSide - self.bounds.size.width;
    
    CGFloat insetY = MAX(0, differenceY);
    CGFloat insetX = MAX(0, differenceX);
    
    return CGRectContainsPoint(CGRectInset(self.bounds, -insetX, -insetY), point) || [super pointInside:point withEvent:event];
}

@end
