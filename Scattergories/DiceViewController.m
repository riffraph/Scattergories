//
//  DiceViewController.m
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "DiceViewController.h"

@implementation DiceViewController

@synthesize lblDice = _lblDice;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(IBAction)btnDice_Clicked:(id)sender
{
    // roll the dice
    // TODO
    
    [self.lblDice setStringValue:@"test"];
}

@end
