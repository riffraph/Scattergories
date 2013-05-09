//
//  DiceViewController.m
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "DiceViewController.h"

@implementation DiceViewController

@synthesize btnDice = _btnDice;

int const BASE = 26;
NSString *const ALPHABET = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";

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
}

-(void)awakeFromNib
{
    [self setDiceLabel:nil];
}

// generate a random number, the lowest number is 0
-(int)generateRandomNumber
{
    return arc4random() % BASE;
}

-(NSString*)lookupAlphaArray:(int)index
{
    if (index >= 0 && index < [ALPHABET length])
    {
        char c = [ALPHABET characterAtIndex:index];
        return [NSString stringWithFormat:@"%c",c];
    }
    else
    {
        return nil;
    }
}

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

-(NSString*)rollDice
{
    int value = arc4random() % BASE;
    
    return [self lookupAlphaArray:value];
}

/**
 * Event handlers
 */

-(IBAction)btnDice_Clicked:(id)sender
{
    // roll the dice
    [self setDiceLabel:[self rollDice]];
}

@end
