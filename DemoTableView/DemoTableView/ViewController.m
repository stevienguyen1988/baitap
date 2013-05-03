//
//  ViewController.m
//  DemoTableView
//
//  Created by iOS12 on 5/3/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"
#define KEY_HEAD @"head"
#define KEY_COUNTRIE @"countries"

@interface ViewController ()

@end

@implementation ViewController
{
    NSArray* _array;
    NSSortDescriptor* _sort;
    NSArray* _sortedarray;
    
    
}
@synthesize tableView;
@synthesize segment;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        NSString * plistfile = [[ NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        _array = [[NSArray alloc]initWithContentsOfFile:plistfile];
        // Custom initialization
        _sort = [[NSSortDescriptor alloc]initWithKey:@"population" ascending:YES];
        
        
    }
    return self;
}
-(IBAction)SortedArray:(id)sender
{
    
    if (segment.selectedSegmentIndex==0) {
        _sort = [[NSSortDescriptor alloc]initWithKey:@"name" ascending:YES];
    }
    if(segment.selectedSegmentIndex==1)
    {
        _sort = [[NSSortDescriptor alloc]initWithKey:@"population" ascending:YES];
    }
    
    [self.tableView reloadData];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return [_array count] ;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[[_array objectAtIndex:section] objectForKey:@"countries"]count];
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[_array objectAtIndex:section] objectForKey:KEY_HEAD];
    
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell*cell = [self.tableView dequeueReusableCellWithIdentifier:@"MainCell"];
    if(!cell)
    {
        
        cell = [[ UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MainCell"];
        
        
    }
    NSArray* countries = [[_array objectAtIndex:indexPath.section]
                          valueForKey:@"countries"];
    
    NSArray* sortedArray= [countries sortedArrayUsingDescriptors:[NSArray arrayWithObject:_sort]];
    
    cell.textLabel.text= [[sortedArray objectAtIndex:indexPath.row]valueForKey: @"name"];
    NSNumber*population = [[sortedArray objectAtIndex:indexPath.row]valueForKey:@"population"];
    cell.detailTextLabel.text = [population stringValue];
    cell.imageView.image = [UIImage imageNamed:[[sortedArray objectAtIndex: indexPath.row]valueForKey:@"icon" ]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WebViewController* webView = [[ WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
    NSArray* countries = [[_array objectAtIndex:indexPath.section]
                          valueForKey:@"countries"];
    
    NSArray* sortedArray= [countries sortedArrayUsingDescriptors:[NSArray arrayWithObject:_sort]];
    NSString*name = [[sortedArray objectAtIndex:indexPath.row]valueForKey: @"name"];
    NSString*inputurl = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@",name];
    [webView insertURL: inputurl ];

    [self presentViewController:webView animated:YES completion:nil];
    
    
}
@end
