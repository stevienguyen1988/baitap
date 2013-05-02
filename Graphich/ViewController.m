//
//  ViewController.m
//  Graphich
//
//  Created by iOS12 on 5/2/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
@implementation ViewController
@synthesize webView;
- (void)viewDidLoad

{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString* pathname = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"/"];
    NSString*html = [NSString stringWithContentsOfFile:pathname encoding:NSUTF8StringEncoding error:nil];
    NSString* path = [[NSBundle mainBundle] bundlePath];
    NSURL* baseURL = [NSURL fileURLWithPath:path];
    [self.webView loadHTMLString:html baseURL:baseURL];
    
}
-(IBAction)Stop:(id)sender
{
    
    [audio stop];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL* url1 = request.URL;
    if([url1.scheme isEqualToString:@"techmaster"])
        
    { NSArray *pairObjectAndMethod = [url1.host componentsSeparatedByString:@"."];
        
       
         //NSString *typeName = pairObjectAndMethod[0];
        
    NSString *nameofsong = pairObjectAndMethod[1];
    NSString * path = [[NSBundle mainBundle]pathForResource:nameofsong ofType:@"mp3"];
    NSURL * url = [[NSURL alloc]initWithString:path];
    audio = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    audio.numberOfLoops =-1;
    [audio play];
        
    
        return NO;}
    else {
    return YES;
    }
}


@end
