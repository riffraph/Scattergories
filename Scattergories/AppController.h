//
//  AppController.h
//  Scattergories
//
//  Created by Raphael Chan on 6/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

@property (weak) IBOutlet NSView *diceView;
@property (strong) NSViewController *diceViewController;

@property (weak) IBOutlet NSView *timerView;
@property (strong) NSViewController *timerViewController;

@property (weak) IBOutlet NSView *buttonsView;
@property (strong) NSViewController *buttonsViewController;

@end
