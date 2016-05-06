//
//  BusTableViewCell.h
//  DemoProject
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BusTableViewCell : UITableViewCell
@property (nonatomic,retain) IBOutlet UILabel* stationName;
@property (nonatomic,retain) IBOutlet UILabel* timeRemaining;
@property (nonatomic,retain) IBOutlet UIImageView* stationLocationImage;
@end
