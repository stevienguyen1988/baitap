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
#define POPULATION_KEY @"population"
#define FLAG_KEY @"icon"
@interface ViewController ()
{
 
    NSArray *_data;
    NSString*_sort;
}
@end

@implementation ViewController
@synthesize segment;
@synthesize tableView;
- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        
        _data = [NSArray arrayWithContentsOfFile:dataPath];
      //  NSArray *countries = [_data valueForKey:COUNTRY_KEY];
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc] initWithKey:_sort
                                                      ascending:YES] ;
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        NSArray *sortedArray;
        sortedArray = [_data sortedArrayUsingDescriptors:sortDescriptors];
        _data = [[NSArray alloc]initWithArray:sortedArray];
       
    }
    return self;
}
-(IBAction)changeSort{
    if (self.segment.selectedSegmentIndex==0) {
        _sort = @"name";
    }
    if (self.segment.selectedSegmentIndex==1) {
        _sort=@"population";
    }
    [self.tableView reloadData];
    
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
  
    return cell;
}
@end
