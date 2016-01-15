//
//  TTLTravelOptionView.h
//  Daniel
//
//  Created by Daniel on 07/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

@import UIKit;

typedef NS_ENUM(NSInteger, TTLTravelOptionImage) {
    TTLTravelOptionImageNone,
    TTLTravelOptionImageMobileTicket,
    TTLTravelOptionImageTFL
};

@interface TTLTravelOptionView : UIView

@property (nonatomic, strong, readonly) UILabel *ticketNameLabel;
@property (nonatomic, strong, readonly) UIButton *ticketRestricitonsButton;
@property (nonatomic, strong, readonly) UILabel *subtitleLabel;
@property (nonatomic, strong, readonly) UILabel *routeRestrictionsLabel;
@property (nonatomic, strong, readonly) UILabel *limitedSeatsLabel;
@property (nonatomic, strong, readonly) UILabel *priceLabel;

@property (nonatomic, assign) BOOL showCheapestLabel;
@property (nonatomic, assign) TTLTravelOptionImage icon;

@end
