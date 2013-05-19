//
//  ViewController.m
//  DemoPiano
//
//  Created by Hong Thai Nguyen on 18.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize audioPlayer;
@synthesize buttonC;
@synthesize ViewA;
@synthesize ViewB;
@synthesize ViewC;
@synthesize ViewD;
@synthesize viewE;
@synthesize ViewF;
@synthesize ViewG;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
   
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];
    _happy = [[NSMutableArray alloc]initWithObjects:@"C",@"D",@"E",@"F",@"G",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"A",@"B", nil];
 //   self.buttonC.hidden = YES;
    ViewA.hidden = YES;
    ViewB.hidden = YES;
    ViewC.hidden = YES;
    ViewD.hidden = YES;
    viewE.hidden = YES;
    ViewF.hidden = YES;
    ViewG.hidden = YES;
    _array = [[NSArray  alloc]initWithObjects:ViewA,ViewB,ViewC,ViewD,viewE,ViewG,ViewF, nil];
    i =0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) playMusic :(NSString*)song
{
    
    NSError *audioSessionError = nil;
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    if([audioSession setCategory:AVAudioSessionCategoryAmbient error:&audioSessionError])
    { NSLog(@"Successfully set the audio session.");}
    else {
        NSLog(@"Could not set the audio session");
    }
    dispatch_queue_t dispatchQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatchQueue, ^(void) { NSBundle *mainBundle = [NSBundle mainBundle];
        NSString *filePath = [mainBundle pathForResource:song ofType:@"wav"];
        NSData *fileData = [NSData dataWithContentsOfFile:filePath]; NSError *audioPlayerError = nil;
        self.audioPlayer = [[AVAudioPlayer alloc] initWithData:fileData error:&audioPlayerError];
        if (self.audioPlayer != nil){
            self.audioPlayer.delegate = self;
            if ([self.audioPlayer prepareToPlay] && [self.audioPlayer play]){
                NSLog(@"Successfully started playing.");
            } else {
                NSLog(@"Failed to play the audio file."); self.audioPlayer = nil;
            } } else {
                NSLog(@"Could not instantiate the audio player."); }
    });
    [self Hidden];
    if ([song isEqualToString:@"A"]) {
        ViewA.hidden = NO;
    }
    if ([song isEqualToString:@"B"]) {
        ViewB.hidden = NO;
    }
    if ([song isEqualToString:@"C"]) {
        ViewC.hidden = NO;
    }
    if ([song isEqualToString:@"D"]) {
        ViewD.hidden =NO;
    }
    if ([song isEqualToString:@"E"]) {
        viewE.hidden = NO;
    }
    if ([song isEqualToString:@"F"]) {
        ViewF.hidden = NO;
    }
    if ([song isEqualToString:@"G"]) {
        ViewG.hidden = NO;
    }
      
    
    
 
    
    
}
-(void) Hidden
{
    for (int i =0; i<[_array count]; i++) {
        UIImageView* test = [_array objectAtIndex:i] ;
        if (!test.hidden) {
            test.hidden=YES;
        }
    
    }
    
    
    
}
- (IBAction)ButtonC:(id)sender {
    
    NSString * song = @"C";
    [self playMusic:song];
   
    
    
}

- (IBAction)ButtonD:(id)sender {
     
    NSString * song = @"D";
    [self playMusic:song];
   
    
}

- (IBAction)ButtonE:(id)sender {
    
    NSString * song = @"E";
    [self playMusic:song];

    
}

- (IBAction)ButtonF:(id)sender {
  
    NSString * song = @"F";
    [self playMusic:song];
    
}

- (IBAction)ButtonG:(id)sender {
  
    NSString * song = @"G";
    [self playMusic:song];
    
}

- (IBAction)ButtonA:(id)sender {
   
    NSString * song = @"A";
    [self playMusic:song];
 
}

- (IBAction)ButtonB:(id)sender {
    
    NSString * song = @"B";
    [self playMusic:song];
    
}

- (IBAction)Birthday:(id)sender {
    _time = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(Happybirthday) userInfo:nil repeats:YES];
}

-(void)Happybirthday
{
    NSString*note = [_happy objectAtIndex:i];
    i++;
    [self playMusic:note];
    if ([_happy count]==i+1) {
        [_time invalidate];
        i=0;
        
    }
   
    
    
    
}
@end
