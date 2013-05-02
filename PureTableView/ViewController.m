//
//  ViewController.m
//  PureTableView
//
//  Created by techmaster on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#define COUNTRY_KEY @"countries"
#define HEADER_KEY @"header"
@interface ViewController ()
{
    UITableView *_tableView;
    NSArray *_data;
}
@end

@implementation ViewController

- (id) init
{
    if (self = [super init])
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        _data = [NSArray arrayWithContentsOfFile:dataPath];
        
        //_data = @[@"Honda", @"Yamaha", @"Suzuki"];
        [self.view addSubview:_tableView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return [_data count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *countries = [_data[section] valueForKey:COUNTRY_KEY];
    return [countries count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_data[section] valueForKey:HEADER_KEY];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"UniqueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSArray *countries = [_data[indexPath.section] valueForKey:COUNTRY_KEY];
   
    cell.textLabel.text = countries[indexPath.row];
    cell.detailTextLabel.text = @"122312432";
    return cell;
}
@end
