//
//  CircleLayout.h
//  CustomLayoutSB
//
//  Created by JON MOODY on 2/19/13.
//  Copyright (c) 2013 JON MOODY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLayout : UICollectionViewLayout

@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) NSInteger cellCount;

@end
