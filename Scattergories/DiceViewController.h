//
//  DiceViewController.h
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DiceViewController : NSViewController

@property (strong) IBOutlet NSTextField *lblDice;

-(IBAction)btnDice_Clicked:(id)sender;

@end
