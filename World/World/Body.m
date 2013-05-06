//
//  Body.m
//  World
//
//  Created by Hong Thai Nguyen on 05.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import "Body.h"

@implementation Body
@synthesize nameAimal;
@synthesize dangerous;
-(void)presentName:(NSString *)name
{
    name = nameAimal;
    
    NSLog(@" %@", name);
}
-(int)returnDangerous
{
 
    return dangerous;
    
}
@end
