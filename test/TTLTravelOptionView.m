//
//  TTLTravelOptionView.m
//  Daniel
//
//  Created by Daniel on 07/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import "TTLTravelOptionView.h"
#import "TTLInfoButton.h"
#import "TTLUIStyleDefines.h"

@interface TTLTravelOptionView ()

@property (nonatomic, strong, readwrite) UILabel *ticketNameLabel;
@property (nonatomic, strong, readwrite) TTLInfoButton *ticketRestricitonsButton;
@property (nonatomic, strong, readwrite) UILabel *subtitleLabel;
@property (nonatomic, strong, readwrite) UILabel *routeRestrictionsLabel;
@property (nonatomic, strong, readwrite) UILabel *priceLabel;

@property (nonatomic, strong) UILabel *cheapestLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@end

@implementation TTLTravelOptionView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView
{
    self.backgroundColor = [UIColor colorWithType:TTLColorTypeWhite];
    
    _ticketNameLabel = ({
        UILabel *label = [UILabel new];
        label.numberOfLines = 0;
        label.textColor = [UIColor colorWithType:TTLColorTypeGrey80];
        label.font = [UIFont systemFontOfSize:17];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label;
    });
    [self addSubview:_ticketNameLabel];
    
    _subtitleLabel = ({
        UILabel *label = [UILabel new];
        label.numberOfLines = 0;
        label.textColor = [UIColor colorWithType:TTLColorTypeGrey54];
        label.font = [UIFont systemFontOfSize:14];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label;
    });
    [self addSubview:_subtitleLabel];
    
    _routeRestrictionsLabel = ({
        UILabel *label = [UILabel new];
        label.numberOfLines = 0;
        label.textColor = [UIColor colorWithType:TTLColorTypeGrey30];
        label.font = [UIFont systemFontOfSize:14];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label;
    });
    [self addSubview:_routeRestrictionsLabel];
    
    _priceLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithType:TTLColorTypeGrey80];
        label.font = [UIFont systemFontOfSize:17];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label;
    });
    [self addSubview:_priceLabel];
    
    _cheapestLabel = ({
        UILabel *label = [UILabel new];
        label.textColor = [UIColor colorWithType:TTLColorTypeMint];
        label.font = [UIFont systemFontOfSize:17];
        label.text = @"Cheapest";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        label;
    });
    [self addSubview:_cheapestLabel];
    
    _ticketRestricitonsButton = ({
        TTLInfoButton *button = [TTLInfoButton new];
        button.accessibilityLabel = @"Ticket Restrictions";
        button;
    });
    [self addSubview:_ticketRestricitonsButton];
    
    _iconImageView = ({
        UIImageView *iconImageView = [UIImageView new];
        iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
        iconImageView;
    });
    [self addSubview:_iconImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cheapestLabel.hidden = !self.showCheapestLabel;
}

- (void)setIcon:(TTLTravelOptionImage)icon
{
    _icon = icon;
    
    switch (_icon) {
        case TTLTravelOptionImageNone:
            self.iconImageView.image = nil;
            break;
        case TTLTravelOptionImageMobileTicket:
            self.iconImageView.image = [UIImage imageNamed:@"mobileticket-available"];
            break;
        case TTLTravelOptionImageTFL:
            self.iconImageView.image = [UIImage imageNamed:@"tube-icon"];
            break;
        default:
            break;
    }
    
    [self setNeedsLayout];
}

- (void)updateConstraints
{
    NSNumber *padding = @16;
    
    NSDictionary *viewBindings = @{
                                   @"ticketNameLabel" : self.ticketNameLabel,
                                   @"ticketRestricitonsButton" : self.ticketRestricitonsButton,
                                   @"priceLabel" : self.priceLabel,
                                   @"subtitleLabel" : self.subtitleLabel,
                                   @"routeRestrictionsLabel" : self.routeRestrictionsLabel,
                                   @"cheapestLabel" : self.cheapestLabel,
                                   @"iconImageView" : self.iconImageView
                                   };
    
    // Line One Horizontal
    NSArray *horizontalLineOne = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[ticketNameLabel]-[ticketRestricitonsButton]-(>=padding)-[priceLabel]|"
                                                                         options:kNilOptions
                                                                         metrics:NSDictionaryOfVariableBindings(padding)
                                                                           views:viewBindings];
    
    [self addConstraints:horizontalLineOne];
    
    [self.priceLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    
    NSLayoutConstraint *labelTopConstraint = [NSLayoutConstraint constraintWithItem:self.ticketNameLabel
                                                                          attribute:NSLayoutAttributeTop
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.priceLabel
                                                                          attribute:NSLayoutAttributeTop
                                                                         multiplier:1
                                                                           constant:0];
    [self addConstraint:labelTopConstraint];
    
    NSLayoutConstraint *buttonTopConstraint = [NSLayoutConstraint constraintWithItem:self.ticketRestricitonsButton
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:self.ticketNameLabel
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1
                                                                            constant:2];
    [self addConstraint:buttonTopConstraint];
    
    // Line Two Horizontal
    NSArray *horizontalLineTwo = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[subtitleLabel]-padding-[cheapestLabel]|"
                                                                       options:kNilOptions
                                                                       metrics:NSDictionaryOfVariableBindings(padding)
                                                                         views:viewBindings];
    [self.subtitleLabel setContentHuggingPriority:UILayoutPriorityDefaultLow
                                          forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.subtitleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh
                                                        forAxis:UILayoutConstraintAxisHorizontal];
    
    
    [self.cheapestLabel setContentHuggingPriority:UILayoutPriorityRequired
                                          forAxis:UILayoutConstraintAxisHorizontal];
    
    [self.cheapestLabel setContentCompressionResistancePriority:UILayoutPriorityRequired
                                                        forAxis:UILayoutConstraintAxisHorizontal];
    
    [self addConstraints:horizontalLineTwo];
    
    // Subtitle and Route label equal trailing (equal width).
    NSLayoutConstraint *trailingConstaint = [NSLayoutConstraint constraintWithItem:self.subtitleLabel
                                                                         attribute:NSLayoutAttributeTrailing
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.routeRestrictionsLabel
                                                                         attribute:NSLayoutAttributeTrailing
                                                                        multiplier:1
                                                                          constant:0];
    [self addConstraint:trailingConstaint];
    
    // LEFT COLUMN VERTICAL
    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[ticketNameLabel][subtitleLabel][routeRestrictionsLabel]-(>=0)-|"
                                                                options:NSLayoutFormatAlignAllLeading
                                                                metrics:nil
                                                                  views:viewBindings];
    [self addConstraints:vertical];
    
    // RIGHT COLUMN VERTICAL
    NSArray *verticalSecondColumn = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[priceLabel][cheapestLabel]-(>=8)-[iconImageView]|"
                                                                options:NSLayoutFormatAlignAllTrailing
                                                                metrics:nil
                                                                  views:viewBindings];
    [self addConstraints:verticalSecondColumn];

    [super updateConstraints];
}

- (void)setShowCheapestLabel:(BOOL)showCheapestLabel
{
    _showCheapestLabel = showCheapestLabel;
    
    [self setNeedsLayout];
}

@end
