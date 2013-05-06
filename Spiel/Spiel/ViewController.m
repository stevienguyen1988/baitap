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
   
    NSTimer* _timerandom;
    float _geschwindigkeit;
    float _beschleunigung;
    BOOL _lauf;
}
@synthesize ziklus1;
@synthesize ziklus2;
@synthesize ziklus3;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"2.png"]];
    _geschwindigkeit=M_PI*6;
    _beschleunigung =M_PI_4/6;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Play:(id)sender
{
    _timerandom = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(random) userInfo:nil repeats:YES];
    
    if(_geschwindigkeit==0)
    {
        
        _geschwindigkeit=M_PI*6;
        
    }
}

- (IBAction)Stop:(id)sender {
    [_timerandom invalidate];
    //_geschwindigkeit=M_PI*20;
}
-(void)random
{
    
   if(_geschwindigkeit !=M_PI*100 &&_lauf)
   {
       
       _geschwindigkeit = _geschwindigkeit + _beschleunigung;
       
   }
   else{
       
       
       _lauf = NO;
   }
    if(!_lauf&&_geschwindigkeit!=0)
    {
        _geschwindigkeit = _geschwindigkeit- _beschleunigung/2;
        
    }
    
        self.ziklus1.transform = CGAffineTransformMakeRotation(_geschwindigkeit);
        self.ziklus2.transform = CGAffineTransformMakeRotation(-_geschwindigkeit);
        self.ziklus3.transform = CGAffineTransformMakeRotation(_geschwindigkeit);
    
   
    if(_geschwindigkeit<M_PI_4/3)
    {
        
        _geschwindigkeit=0;
        
    }
    
   
    
    
    
}
@end
