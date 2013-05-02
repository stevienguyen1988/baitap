//
//  ViewController.h
//  Graphich
//
//  Created by iOS12 on 5/2/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController<UIWebViewDelegate>
{
    
    
    AVAudioPlayer* audio;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;
-(IBAction)Stop:(id)sender;

@end
