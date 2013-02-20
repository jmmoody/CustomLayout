//
//  Cell.h
//  CustomLayoutSB
//
//  Created by JON MOODY on 2/19/13.
//  Copyright (c) 2013 JON MOODY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCellBackground.h"

@interface Cell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *myImage;
@property (strong, nonatomic) IBOutlet UILabel *myLabel;

@end
