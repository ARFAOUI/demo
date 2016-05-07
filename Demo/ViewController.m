//
//  ViewController.m
//  Demo
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import "ViewController.h"
#import "BusTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "Station.h"
#import "Config.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Bus Info";
    [self startDownload];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)startDownload{
    if (!self.myAPIConnector) {
        self.myAPIConnector =  [[APIConnector alloc]init];
        self.myAPIConnector.datasourceDelegate = self;
    }
    [self.myAPIConnector downloadData];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TableViewcell";
    BusTableViewCell *cell = (BusTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BusTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Station* myStation = [self.datasource objectAtIndex:indexPath.row];
    cell.stationName.text = [myStation nameToDiplay];
    NSString* url = [myStation locationImageUrl];

    [cell.stationLocationImage sd_setImageWithURL:[NSURL URLWithString:url]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    NSString*estimateEndpointUrlString = [NSString stringWithFormat:@"%@/%i",API_ENDPOINT,(int)[myStation stationId]];
    NSURL *estimateEndpointUrl = [NSURL URLWithString:estimateEndpointUrlString];
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:estimateEndpointUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            NSString* text = [myStation timeOftheNextBus:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                //update UI
                cell.timeRemaining.text = text;
            });
        }
    }];
    
    [task resume];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datasource.count;
}

-(void)didReceiveItems:(NSMutableArray *)items{
    if (items.count == 0) {
         [self displayMessage:@"sorry! we have no data to display right now, please try again later "];
    }
    self.datasource = items;
    [self.mytableView reloadData];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

-(void)didFailReceivingItems:(NSString *)message{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self displayMessage:@"sorry! something wrong with the service, please try again later"];
}

-(void)displayMessage:(NSString*)message{
    //display message to the user heres
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}
@end
