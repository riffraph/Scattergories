//
//  TimerViewController.h
//  Scattergories
//
//  Created by Raphael Chan on 7/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TimerViewController : NSViewController

@property (strong) IBOutlet NSTextField *lblTimer;
@property (strong) IBOutlet NSTextField *lblMaxTime;

-(IBAction)btnStart_clicked:(id)sender;
-(IBAction)btnReset_clicked:(id)sender;

@end
