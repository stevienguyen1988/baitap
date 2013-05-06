//
//  ViewController.m
//  World
//
//  Created by Hong Thai Nguyen on 05.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import "ViewController.h"
#import "Tiger.h"
#import "Birg.h"
#import "Chicken.h"
#import "Animal.h"
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        Tiger*tiger = [Tiger new];
        Birg* birg = [Birg new];
        Chicken* chicken = [Chicken new];
        tiger.dangerous = 2;
        tiger.nameAimal = @"Tiger";
        birg.dangerous=1;
        birg.nameAimal = @"Birg";
        chicken.nameAimal=@"Chicken";
        chicken.dangerous=1;
        _array = [[NSArray alloc]initWithObjects:tiger,birg,chicken, nil];
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






- (IBAction)NameOfAnimal:(id)sender {
    for (int i =0; i<[_array count]; i++) {
        [[_array objectAtIndex:i]presentName:nil];
    
    }
    
}

- (IBAction)WhoCanFly:(id)sender {
    for (int i =0; i<[_array count]; i++) {
        id<Animal> animal = [_array objectAtIndex:i];
        if([animal respondsToSelector:@selector(canFly)])
        {
            [animal canFly];
            [animal presentName:nil];
            
        }
    }
}

- (IBAction)WhoCanEat:(id)sender {
    
    for (int i =0; i<[_array count]; i++) {
        
        for (int j =0; j<[_array count]; j++) {
            id<Animal> animal1 = [_array objectAtIndex:i];
            id<Animal> animal2 = [_array objectAtIndex:j];
       
            if ([animal1 returnDangerous] >[animal2 returnDangerous]) {
              
                [animal1 presentName:nil];
                NSLog(@" can eat ");
                [animal2 presentName:nil];
            }
            
            
        }
        
        
    }
}


@end
