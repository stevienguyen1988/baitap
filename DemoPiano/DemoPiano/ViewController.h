//
//  ViewController.h
//  DemoPiano
//
//  Created by Hong Thai Nguyen on 18.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<AVAudioPlayerDelegate>
{
    
    NSMutableArray * _happy;
    NSArray * _array ;
    NSTimer * _time;
    int i ;
}
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
- (IBAction)ButtonC:(id)sender;
- (IBAction)ButtonD:(id)sender;
- (IBAction)ButtonE:(id)sender;
- (IBAction)ButtonF:(id)sender;
- (IBAction)ButtonG:(id)sender;
- (IBAction)ButtonA:(id)sender;
- (IBAction)ButtonB:(id)sender;
- (IBAction)Birthday:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *ViewG;
@property (weak, nonatomic) IBOutlet UIButton *buttonC;
@property (weak, nonatomic) IBOutlet UIImageView *ViewF;

@property (weak, nonatomic) IBOutlet UIImageView *ViewC;
@property (weak, nonatomic) IBOutlet UIImageView *ViewD;
@property (weak, nonatomic) IBOutlet UIImageView *viewE;
@property (weak, nonatomic) IBOutlet UIImageView *ViewA;
@property (weak, nonatomic) IBOutlet UIImageView *ViewB;

@end
