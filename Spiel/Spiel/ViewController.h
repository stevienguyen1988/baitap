//
//  ViewController.h
//  Spiel
//
//  Created by iOS12 on 5/6/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *ziklus1;
@property (weak, nonatomic) IBOutlet UIImageView *ziklus2;
@property (weak, nonatomic) IBOutlet UIImageView *ziklus3;
- (IBAction)Play:(id)sender;
- (IBAction)Stop:(id)sender;

@end
