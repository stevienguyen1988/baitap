//
//  WebViewController.m
//  DemoTableView
//
//  Created by iOS12 on 5/3/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import "WebViewController.h"
#import "ViewController.h"
@interface WebViewController ()

@end

@implementation WebViewController
{
    
    NSString* _url;
    
}
@synthesize button;
@synthesize webView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
            }
    return self;
}
-(void)insertURL:(NSString *)urlinput
{
    
    _url = urlinput;

    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    NSURL* url = [NSURL URLWithString:_url];
    NSURLRequest *request = [[ NSURLRequest alloc]initWithURL:url];
    [self.webView loadRequest:request ];
}
-(void)back
{
    ViewController* viewcontroller = [[ ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self presentViewController:viewcontroller animated:YES completion:nil];
    
    
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
