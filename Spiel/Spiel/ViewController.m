//
//  ViewController.m
//  Spiel
//
//  Created by iOS12 on 5/6/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    
    int _time ;
    NSTimer* _timerandom;
    int _radius;
}
@synthesize ziklus1;
@synthesize ziklus2;
@synthesize ziklus3;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]];
    _time =2;
    _radius =50;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Play:(id)sender
{
    _timerandom = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(random) userInfo:nil repeats:YES];
    
    
}

- (IBAction)Stop:(id)sender {
    [_timerandom invalidate];
}
-(void)random
{
    
   
        self.ziklus1.transform = CGAffineTransformMakeRotation(_radius);
        self.ziklus2.transform = CGAffineTransformMakeRotation(-_radius);
        self.ziklus3.transform = CGAffineTransformMakeRotation(_radius);
        _radius--;
      
 
        if(_radius==0)
        {
            
            [_timerandom invalidate];
        }
    
   
    
    
    
}
@end
