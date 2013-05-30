//
//  DiceViewController.m
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "DiceViewController.h"
#import "AlphaGen.h"

@implementation DiceViewController

@synthesize btnDice = _btnDice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(void)dealloc
{
    self.btnDice = nil;
    self.lblMaxTime = nil;
    self.lblTimer = nil;
    self.lblStartSeq = nil;
    self.btnStart = nil;
    _timer = nil;
}

-(void)awakeFromNib
{
    [self reset];
}

-(void)reset
{
    [self setDiceLabel:nil];
    [self stopTimer];
    [self resetTimer];
    [self setTimerLabel];
    [self setButtonState];
    [self setStartCounterLabel];
}

/**
 * dice stuff
 */

-(void)setDiceLabel:(NSString*)diceStr
{
    if (diceStr == nil)
    {
        diceStr = @"roll me";
        
        [self.btnDice setFont:[NSFont fontWithName:@"Lucida Grande" size:20]];
    }
    else
    {
        [self.btnDice setFont:[NSFont fontWithName:@"Lucida Grande" size:80]];
    }
    
    [self.btnDice setTitle:diceStr];
}

-(void)rollDice
{
    [self setDiceLabel:[AlphaGen generateAlpha]];
}


/**
 * timer stuff
 */

-(void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer_fired) userInfo:nil repeats:YES];
    
    if (self.currentState == Reset || (self.currentState == Stopped && currStartCounter > 0))
    {
        self.currentState = StartSequence;
    }
    else
    {
        self.currentState = Running;
    }
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
    currStartCounter = 5;
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


/**
 * start counter stuff
 */
-(void)setStartCounterLabel
{
    if (self.currentState == StartSequence)
    {
        if (currStartCounter == 0)
        {
            [self.lblStartSeq setStringValue:@"Start!"];
        }
        else
        {
            [self.lblStartSeq setStringValue:[NSString stringWithFormat:@"%d",currStartCounter]];
        
            if (currStartCounter < 3)
            {
                [self.lblStartSeq setTextColor:[NSColor redColor]];
            }
            else
            {
                [self.lblStartSeq setTextColor:[NSColor blackColor]];
            }
        }
    }
    else
    {
        // hide the counter if the start sequence isn't running
        [self.lblStartSeq setStringValue:@""];
    }
}


/**
 * button stuff
 */

-(void)setButtonState
{
    // set the labels
    switch (self.currentState)
    {
        case Stopped:
            [self.btnStart setTitle:@"Resume"];
            break;
            
        case Reset:
        case StartSequence:
        case Running:
        case Finished:
            [self.btnStart setTitle:@"Stop"];
            break;
    }
    
    // set the enabled/disabled
    switch (self.currentState)
    {
        case Stopped:
        case StartSequence:
        case Running:
            // enable the timer controls
            [self.btnStart setEnabled:TRUE];
            [self.btnReset setEnabled:TRUE];
            break;
            
        case Finished:
            // enable the timer controls
            [self.btnStart setEnabled:FALSE];
            [self.btnReset setEnabled:TRUE];
            break;
            
        case Reset:
            // disable the timer controls
            [self.btnStart setEnabled:FALSE];
            [self.btnReset setEnabled:FALSE];
            break;
    }        
}


/**
 * Event handlers
 */

-(IBAction)btnDice_Clicked:(id)sender
{
    if (self.currentState == Reset)
    {
        // initiate the timer
        [self startTimer];
    
        // roll the dice
        [self rollDice];
    
        [self setButtonState];
    }
}

-(void)timer_fired
{
    [self setStartCounterLabel];
    
    if (currStartCounter == 0 || self.currentState == Running)
    {
        self.currentState = Running;
        
        // decrement main timer
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
            [self setButtonState];
        }
    }
    else
    {
        if (currStartCounter > 2)
        {
            [self rollDice];
        }
        
        // decrement start sequence counter
        currStartCounter -= 1;
    }
}

-(IBAction)btnStart_clicked:(id)sender
{
    switch (self.currentState)
    {
        case Stopped:
            [self startTimer];
            break;
            
        case StartSequence:
        case Running:
            [self stopTimer];
            break;
            
        case Finished:
        case Reset:
            break;
    }
    
    [self setButtonState];
}

-(IBAction)btnReset_clicked:(id)sender
{
    [self reset];
}

@end
