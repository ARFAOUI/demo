//
//  ViewController.h
//  Demo
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIConnector.h"

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,DataSourceDelegate>
@property (nonatomic,retain) NSMutableArray*datasource;
@property (nonatomic,retain) IBOutlet UITableView* mytableView;
@property (nonatomic,retain) APIConnector *myAPIConnector;
@end

