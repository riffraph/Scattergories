//
//  AlphaGen.m
//  Scattergories
//
//  Created by Raphael Chan on 30/05/13.
//  Copyright (c) 2013 Raphael Chan. All rights reserved.
//

#import "AlphaGen.h"

@implementation AlphaGen

int const BASE = 26;
NSString *const ALPHABET = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";

+(NSString*)lookupAlphaArray:(int)index
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

+(NSString*)generateAlpha
{
    int value = arc4random() % BASE;
    
    return [self lookupAlphaArray:value];
}

@end
