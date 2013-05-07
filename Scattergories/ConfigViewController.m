//
//  ConfigViewController.m
//  Scattergories
//
//  Created by Raphael Chan on 7/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "ConfigViewController.h"

@implementation ConfigViewController

@synthesize maxTime = _maxTime;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        self.maxTime = 10;
    }
    
    return self;
}

@end
