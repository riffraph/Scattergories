//
//  AppController.m
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "AppController.h"
#import "DiceViewController.h"

@implementation AppController

@synthesize diceView = _diceView;
@synthesize diceViewController = _diceViewController;


- (void)awakeFromNib
{
    // render the dice
    self.diceViewController = [[DiceViewController alloc] initWithNibName:@"DiceViewController" bundle:nil];
    [self.diceView addSubview:[self.diceViewController view]];
//    [[self.diceViewController view] setFrame:[self.diceView bounds]];
}

@end
