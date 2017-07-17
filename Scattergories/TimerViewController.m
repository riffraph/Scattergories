//
//  TimerViewController.m
//  Scattergories
//
//  Created by Raphael Chan on 7/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "TimerViewController.h"

@implementation TimerViewController

@synthesize currentState = _currentState;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)awakeFromNib
{
    [self resetTimer];
    [self setTimerLabel];
    [self setStartStopLabel];
}

-(void)dealloc
{
    _timer = nil;
}

-(void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer_fired) userInfo:nil repeats:YES];
    self.currentState = Running;
}

-(void)stopTimer
{
    [_timer invalidate];

    if (currMinute <= 0 && currSeconds == 0)
    {
        self.currentState = Finished;
    }
    else
    {
        self.currentState = Stopped;
    }
}

-(void)resetTimer
{
    // TODO: use the configured countdown
    currMinute = 0;
    currSeconds = 35;
    
    self.currentState = Reset;
}

-(void)setTimerLabel
{
    [self.lblTimer setStringValue:[NSString stringWithFormat:@"%d%@%02d",currMinute,@":",currSeconds]];
    
    if (currMinute == 0 && currSeconds <= 10)
    {
        [self.lblTimer setTextColor:[NSColor redColor]];
    }
    else if (currMinute == 0 && currSeconds <= 30)
    {
        [self.lblTimer setTextColor:[NSColor orangeColor]];
    }
    else
    {
        [self.lblTimer setTextColor:[NSColor blackColor]];
    }
}

-(void)setStartStopLabel
{
    switch (self.currentState)
    {
        case Stopped:
        case Reset:
            [self.btnStart setTitle:@"Start"];
            break;
            
        case Running:
            [self.btnStart setTitle:@"Stop"];
            break;
    }
}

//
// event handlers
//

-(void)timer_fired
{
    if ((currMinute > 0 || currSeconds >= 0) && currMinute >= 0)
    {
        if (currSeconds == 0)
        {
            currMinute -= 1;
            currSeconds = 59;
        }
        else if (currSeconds > 0)
        {
            currSeconds -= 1;
        }
        if (currMinute >- 1)
        {
            [self setTimerLabel];
        }
    }
    else
    {
        [self stopTimer];
    }
}

-(IBAction)btnStart_clicked:(id)sender
{
    switch (self.currentState)
    {
        case Stopped:
        case Reset:
            [self startTimer];
            break;
            
        case Running:
            [self stopTimer];
            break;
    }
    
    [self setStartStopLabel];
}

-(IBAction)btnReset_clicked:(id)sender
{
    [self stopTimer];
    [self resetTimer];
    [self setTimerLabel];
}

@end
