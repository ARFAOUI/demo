//
//  DataSourceDelegate.h
//  DemoProject
//
//  Created by Bechir Arfaoui on 05/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataSourceDelegate <NSObject>
-(void)didReceiveItems:(NSMutableArray*)items;
-(void)didFailReceivingItems:(NSString*)message;
@end
