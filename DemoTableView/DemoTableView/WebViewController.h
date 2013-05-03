//
//  WebViewController.h
//  DemoTableView
//
//  Created by iOS12 on 5/3/13.
//  Copyright (c) 2013 iOS12. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIButton *button;
-(void)insertURL : (NSString*)urlinput;
@end
