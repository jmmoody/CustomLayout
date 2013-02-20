//
//  ViewController.m
//  CustomLayoutSB
//
//  Created by JON MOODY on 2/19/13.
//  Copyright (c) 2013 JON MOODY. All rights reserved.
//

#import "ViewController.h"

NSString *kCellID = @"cellID";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self->cellCount = 32;
    
    UITapGestureRecognizer  *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self->cellCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    // we're going to use a custom UICollectionViewCell, which will hold an image and its label
    //
    Cell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    
    // make the cell's title the actual NSIndexPath value
    cell.myLabel.text = [NSString stringWithFormat:@"{%ld,%ld}", (long)indexPath.row, (long)indexPath.section];
    
    // load the image for this cell
    NSString *imageToLoad = [NSString stringWithFormat:@"%d.png", indexPath.row];
    cell.myImage.image = [UIImage imageNamed:imageToLoad];
    
    return cell;
}

- (void) handleTapGesture:(UITapGestureRecognizer*) sender
{
    if(sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath *tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        if(tappedCellPath!=nil)
        {
            self->cellCount = self->cellCount -1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:tappedCellPath]];
            }completion:nil];
        }else{
            self->cellCount = self->cellCount +1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView insertItemsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForItem:0 inSection:0]]];
            }completion:nil];
        }
    }
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.collectionView reloadData];
}

@end
