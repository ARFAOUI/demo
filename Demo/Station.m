//
//  Station.m
//  Demo
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import "Station.h"

@implementation Station

- (NSString*) locationImageUrl{
    NSString* urlString =
    [NSString stringWithFormat:@"https://maps.googleapis.com/maps/api/staticmap?center=%@,%@&zoom=15&size=200x120&sensor=false",self.lattitude,self.longitude];
    return urlString;
}

- (NSString*) nameToDiplay{
    return [NSString stringWithFormat:@"%i - %@",(int)self.stationId,self.name];
}

- (NSString*) timeOftheNextBus:(NSData*)data{
    NSError* error = nil;
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    if (error) {
        return nil;
    }
    NSArray* list = (NSArray*)dict[@"estimates"];
    NSLog(@"%lu estimates",(unsigned long)list.count);
    if (list.count>0) {
        NSString* UiOutput =[NSString stringWithFormat:@"[%@] Bus direction %@ in %@ min",
                             [[list objectAtIndex:0] objectForKey:@"line"],
                             [[list objectAtIndex:0] objectForKey:@"direction"],
                             [[list objectAtIndex:0] objectForKey:@"estimate"]];
        return UiOutput;
    }
    return @"no data available now";
}
@end
