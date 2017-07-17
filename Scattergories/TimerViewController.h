//
//  TimerViewController.h
//  Scattergories
//
//  Created by Raphael Chan on 7/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TimerViewController : NSViewController
{
    NSTimer *_timer;
    int currMinute;
    int currSeconds;
    
    enum State
    {
        Stopped = 0,
        Running,
        Reset,
        Finished
    };
}

@property int currentState;

@property (strong) IBOutlet NSTextField *lblTimer;
@property (strong) IBOutlet NSTextField *lblMaxTime;
@property (strong) IBOutlet NSButton *btnStart;

-(IBAction)btnStart_clicked:(id)sender;
-(IBAction)btnReset_clicked:(id)sender;

-(void)startTimer;
-(void)stopTimer;
-(void)resetTimer;

@end
