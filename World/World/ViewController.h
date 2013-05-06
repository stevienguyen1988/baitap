//
//  ViewController.h
//  World
//
//  Created by Hong Thai Nguyen on 05.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Animal.h"
#import "Body.h"
@interface ViewController : UIViewController
{
    
    NSArray*    _array;
    
}
- (IBAction)NameOfAnimal:(id)sender;
- (IBAction)WhoCanFly:(id)sender;
- (IBAction)WhoCanEat:(id)sender;

@end
