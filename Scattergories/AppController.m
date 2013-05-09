//
//  AppController.m
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "AppController.h"
#import "DiceViewController.h"
#import "TimerViewController.h"
#import "ConfigViewController.h"

@implementation AppController

@synthesize diceView = _diceView;
@synthesize diceViewController = _diceViewController;

@synthesize timerView = _timerView;
@synthesize timerViewController = _timerViewController;

@synthesize configView = _configView;
@synthesize configViewController = _configViewController;


- (void)awakeFromNib
{
    // render the dice
    self.diceViewController = [[DiceViewController alloc] initWithNibName:@"DiceViewController" bundle:nil];
    [self.diceView addSubview:[self.diceViewController view]];
//    [[self.diceViewController view] setFrame:[self.diceView bounds]];
    
    // render the timer
    self.timerViewController = [[TimerViewController alloc] initWithNibName:@"TimerViewController" bundle:nil];
    [self.timerView addSubview:[self.timerViewController view]];
//    [[self.timerViewController view] setFrame:[self.timerView bounds]];
    /*
    self.configViewController = [[ConfigViewController alloc] initWithNibName:@"ConfigViewController" bundle:nil];
    [self.diceView addSubview:[self.configViewController view]];*/
}

@end
