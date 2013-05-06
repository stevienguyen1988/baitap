//
//  ViewController.m
//  baitap2
//
//  Created by iOS12 on 5/3/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)Graphich:(id)sender {
    
    int b  = 60/3;
    for (int i =0; i<b; i++) {
        printf(".   ");
    }
    printf("\n");
    printf(" ");
    for (int i =0; i<b*2; i++) {
        
        printf(". ");
    }
    printf("\n");
    printf("  ");
    for (int i =0; i<b; i++) {
        printf(".   ");
    }
}
@end
