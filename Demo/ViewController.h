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
@property (nonatomic,strong) NSMutableArray*datasource;
@property (nonatomic,strong) IBOutlet UITableView* mytableView;
@property (nonatomic,strong) UIRefreshControl*refreshControl;
@property (nonatomic,strong) APIConnector *myAPIConnector;
@end

