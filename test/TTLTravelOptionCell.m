//
//  TTLTravelOptionCell.m
//  Daniel
//
//  Created by Daniel on 07/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import "TTLTravelOptionCell.h"
#import "TTLTravelOptionView.h"
#import "TTLUIStyleDefines.h"

@interface TTLTravelOptionCell ()
@property (weak, nonatomic) IBOutlet TTLTravelOptionView *travelOptionView;
@end

@implementation TTLTravelOptionCell

- (UIView *)backgroundViewWithColor:(UIColor *)color
{
    UIImage *image = [UIImage imageNamed:@"ticket_background"];

    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.tintColor = color;
    
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.backgroundColor = [UIColor colorWithType:TTLColorTypeGrey8];
    [view addSubview:imageView];
    
    NSArray *horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[imageView]-|" options:kNilOptions metrics:@{} views:NSDictionaryOfVariableBindings(imageView)];
    NSArray *vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView]-(6)-|" options:kNilOptions metrics:@{} views:NSDictionaryOfVariableBindings(imageView)];
    
    [view addConstraints:horizontal];
    [view addConstraints:vertical];
    return view;
}

- (void)awakeFromNib
{
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    [self.travelOptionView.ticketRestricitonsButton addTarget:self action:@selector(ticketInfoButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    self.backgroundView = [self backgroundViewWithColor:[UIColor whiteColor]];
    self.selectedBackgroundView = [self backgroundViewWithColor:[UIColor colorWithType:TTLColorTypeGrey12]];
}

#pragma mark - Actions

- (void)ticketInfoButtonPressed:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(travelOptionCellDidTapOnTicketInfoButton:)]) {
        [self.delegate travelOptionCellDidTapOnTicketInfoButton:self];
    }
}

#pragma mark - Travel Option Binding

- (NSString *)price
{
    return self.travelOptionView.priceLabel.text;
}

- (void)setPrice:(NSString *)price
{
    self.travelOptionView.priceLabel.text = price;
}

- (NSString *)ticketName
{
    return self.travelOptionView.ticketNameLabel.text;
}

- (void)setTicketName:(NSString *)ticketName
{
    self.travelOptionView.ticketNameLabel.text = ticketName;
}

- (NSString *)travelOptionDetails
{
    return self.travelOptionView.subtitleLabel.text;
}

- (void)setTravelOptionDetails:(NSString *)travelOptionDetails
{
    self.travelOptionView.subtitleLabel.text = travelOptionDetails;
}

- (NSString *)routeRestrictions
{
    return self.travelOptionView.routeRestrictionsLabel.text;
}

- (void)setRouteRestrictions:(NSString *)routeRestrictions
{
    self.travelOptionView.routeRestrictionsLabel.text = routeRestrictions;
}

- (NSString *)limitedSeats
{
    return self.travelOptionView.limitedSeatsLabel.text;
}

- (void)setLimitedSeats:(NSString *)limitedSeats
{
    if(limitedSeats.length > 0) {
        self.travelOptionView.limitedSeatsLabel.text = limitedSeats;
    } else {
        self.travelOptionView.limitedSeatsLabel.text = nil;
    }
}

- (BOOL)isCheapest
{
    return self.travelOptionView.showCheapestLabel;
}

- (void)setCheapest:(BOOL)cheapest
{
    if(cheapest) {
        self.travelOptionView.showCheapestLabel = YES;
    } else {
        self.travelOptionView.showCheapestLabel = NO;
    }
}

- (void)setTFLAvailable:(BOOL)TFLAvailable
{
    if (TFLAvailable) {
        self.travelOptionView.icon = TTLTravelOptionImageTFL;
    }
}

- (void)setMobileTicketAvailable:(BOOL)mobileTicketAvailable
{
    if (mobileTicketAvailable) {
        self.travelOptionView.icon = TTLTravelOptionImageMobileTicket;
    }
}

@end
