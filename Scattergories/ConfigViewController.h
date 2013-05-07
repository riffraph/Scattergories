//
//  ConfigViewController.h
//  Scattergories
//
//  Created by Raphael Chan on 7/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ConfigViewController : NSViewController

@property (strong) IBOutlet NSTextField *lblTimerMax;

@property (nonatomic, readwrite) TimeValue maxTime;


@end
