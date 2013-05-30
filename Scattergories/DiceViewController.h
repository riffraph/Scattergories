//
//  DiceViewController.h
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DiceViewController : NSViewController
{
    NSTimer *_timer;
    int currMinute;
    int currSeconds;
    int currStartCounter;
    
    enum State
    {
        Reset = 0,
        StartSequence,
        Running,
        Finished,
        Stopped        
    };
}

@property int currentState;
@property (strong) IBOutlet NSButton *btnDice;
@property (strong) IBOutlet NSTextField *lblTimer;
@property (strong) IBOutlet NSTextField *lblStartSeq;
@property (strong) IBOutlet NSTextField *lblMaxTime;
@property (strong) IBOutlet NSButton *btnStart;
@property (strong) IBOutlet NSButton *btnReset;

-(IBAction)btnDice_Clicked:(id)sender;
-(IBAction)btnStart_clicked:(id)sender;
-(IBAction)btnReset_clicked:(id)sender;

-(void)startTimer;
-(void)stopTimer;
-(void)resetTimer;

@end
