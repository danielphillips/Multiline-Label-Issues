//
//  ViewController.m
//  test
//
//  Created by Daniel on 15/01/2016.
//  Copyright © 2016 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "TTLTravelOptionView.h"
#import "TTLTravelOptionCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TTLTravelOptionView *travelOptionView;
@end

@implementation ViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TTLTravelOptionCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"travelOptionCell"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TTLTravelOptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"travelOptionCell" forIndexPath:indexPath];
    
    cell.ticketName = @"Verterem phaedrum volutpat vix et";
    cell.travelOptionDetails = @"His elaboraret necessitatibus an";
    cell.routeRestrictions = @"Lorem ipsum dolor sit amet, vidit facilisi comprehensam et pri, te cum oratio fuisset, ad pri modo suas. Quo ut rebum dicat vivendo, meis exerci tempor eum ut. Nec novum inimicus id.";
    cell.price = @"£18.90";
    cell.cheapest = YES;

    return cell;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
