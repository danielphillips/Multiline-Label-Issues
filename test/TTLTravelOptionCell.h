//
//  TTLTravelOptionCell.h
//  Daniel
//
//  Created by Daniel on 07/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

@import UIKit;

@protocol TTLTravelOptionCellDelegate;

@interface TTLTravelOptionCell : UITableViewCell

@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *ticketName;
@property (nonatomic, copy) NSString *travelOptionDetails;
@property (nonatomic, copy) NSString *routeRestrictions;
@property (nonatomic, copy) NSString *limitedSeats;
@property (nonatomic, assign, getter=isCheapest) BOOL cheapest;
@property (nonatomic, assign) BOOL mobileTicketAvailable;
@property (nonatomic, assign) BOOL TFLAvailable;

@property (nonatomic, weak) id<TTLTravelOptionCellDelegate> delegate;

@end

@protocol TTLTravelOptionCellDelegate <NSObject>

- (void)travelOptionCellDidTapOnTicketInfoButton:(TTLTravelOptionCell *)cell;

@end
