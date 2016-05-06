//
//  APIConnector.m
//  DemoProject
//
//  Created by Bechir Arfaoui on 05/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//



#import "APIConnector.h"
#import "Station.h"
#import "Config.h"

@implementation APIConnector

-(void)downloadData{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:API_ENDPOINT]];
    [request setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (error) {
                                                    NSLog(@"%@",error.description);
                                                }else{
                                                    [self handleItems:data];
                                                }
                                            }];
    
    [task resume];

}

-(void)handleItems:(NSData*)data{
    NSMutableArray* stationsArray = [[NSMutableArray alloc]init];
    stationsArray = [self parse:data];
    //back to main thread to update UI
    dispatch_async(dispatch_get_main_queue(), ^{
         [self.datasourceDelegate didReceiveItems:stationsArray];
    });
}

-(NSMutableArray*)parse:(NSData*)data{
    NSError* error = nil;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (error) {
        return nil;
    }
    NSArray* list = (NSArray*)dict[@"locations"];
    NSMutableArray* stationsArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < list.count; i ++) {
        Station * item = [[Station alloc]init];
        item.name = [[list objectAtIndex:i] objectForKey:@"title"];
        item.stationId = [[[list objectAtIndex:i] objectForKey:@"id"] doubleValue];
        item.lattitude = [[list objectAtIndex:i] objectForKey:@"lat"] ;
        item.longitude = [[list objectAtIndex:i] objectForKey:@"lon"];
        [stationsArray addObject:item];
    }
    return stationsArray;
}
@end
