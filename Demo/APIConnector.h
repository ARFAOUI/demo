//
//  APIConnector.h
//  DemoProject
//
//  Created by Bechir Arfaoui on 05/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceDelegate.h"


@interface APIConnector : NSObject
- (void)downloadData;
- (NSMutableArray*)parse:(NSData*)data;
@property (nonatomic,strong) id<DataSourceDelegate> datasourceDelegate;

@end
