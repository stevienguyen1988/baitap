//
//  Animal.h
//  World
//
//  Created by Hong Thai Nguyen on 05.05.13.
//  Copyright (c) 2013 thainguyen. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Animal <NSObject>

@required

-(void) presentName :(NSString*)name;
-(int) returnDangerous;
@optional
-(void) canFly ;
@end
