//
//  DemoTests.m
//  DemoTests
//
//  Created by Bechir Arfaoui on 06/05/16.
//  Copyright © 2016 Bechir Arfaoui. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "APIConnector.h"
#import <OCMock/OCMock.h>
#import "ViewController.h"

@interface DemoTests : XCTestCase
@property (nonatomic, strong) ViewController *vc;
@end

@implementation DemoTests

- (void)setUp {
    [super setUp];
    self.vc = [[ViewController alloc]initWithNibName:@"ViewController" bundle:nil];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
     self.vc = nil;
}

#pragma mark - business tests
- (void)testdownloadIsCalled {
    APIConnector *connecter = [[APIConnector alloc] init];
    id apiConnectorprotocol = [OCMockObject partialMockForObject:connecter];
    [[apiConnectorprotocol expect] downloadData];
    [apiConnectorprotocol downloadData];
    [apiConnectorprotocol verify];
    
}


#pragma mark - View loading tests
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.vc.view, @"View not initiated properly");
}

- (void)testParentViewHasTableViewSubview
{
    NSArray *subviews = self.vc.view.subviews;
    XCTAssertTrue([subviews containsObject:self.vc.mytableView], @"View does not have a table subview");
}

-(void)testThatTableViewLoads
{
    XCTAssertNotNil(self.vc.mytableView, @"TableView not initiated");
}

#pragma mark - UITableView tests
- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.vc conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatTableViewHasDataSource
{
    XCTAssertNotNil(self.vc.mytableView.dataSource, @"Table datasource cannot be nil");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.vc conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testTableViewIsConnectedToDelegate
{
    XCTAssertNotNil(self.vc.mytableView.delegate, @"Table delegate cannot be nil");
}


@end
