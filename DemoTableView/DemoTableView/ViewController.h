//
//  ViewController.h
//  DemoTableView
//
//  Created by iOS12 on 5/3/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(IBAction)SortedArray:(id)sender;
@end
