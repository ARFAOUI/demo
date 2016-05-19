//
//  BusTableViewCell.h
//  DemoProject
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BusTableViewCell : UITableViewCell
@property (nonatomic,strong) IBOutlet UILabel* stationName;
@property (nonatomic,strong) IBOutlet UILabel* timeRemaining;
@property (nonatomic,strong) IBOutlet UIImageView* stationLocationImage;
@end
