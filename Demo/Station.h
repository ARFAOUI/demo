//
//  Station.h
//  Demo
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Station : NSObject
@property (nonatomic,strong) NSString* name;
@property (nonatomic,assign) double stationId;
@property (nonatomic,strong) NSString* lattitude;
@property (nonatomic,strong) NSString* longitude;

- (NSString*) locationImageUrl;
- (NSString*) nameToDiplay;
- (NSString*) timeOftheNextBus:(NSData*)data;
@end
