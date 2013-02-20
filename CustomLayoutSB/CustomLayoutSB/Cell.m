//
//  Cell.m
//  CustomLayoutSB
//
//  Created by JON MOODY on 2/19/13.
//  Copyright (c) 2013 JON MOODY. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // change to our custom selected background view
        CustomCellBackground *backgroundView = [[CustomCellBackground alloc] initWithFrame:CGRectZero];
        self.selectedBackgroundView = backgroundView;
    }
    return self;
}


@end
