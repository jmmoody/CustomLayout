//
//  CircleLayout.m
//  CustomLayoutSB
//
//  Created by JON MOODY on 2/19/13.
//  Copyright (c) 2013 JON MOODY. All rights reserved.
//

#import "CircleLayout.h"

#define ITEM_SIZEh 50
#define ITEM_SIZEw 74

@implementation CircleLayout

-(void) prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    _radius = MIN(size.width, size.height) / 2.5;
    
    
}

-(CGSize) collectionViewContentSize
{
    return [self collectionView].frame.size;
}

-(UICollectionViewLayoutAttributes*) layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    
    attributes.size = CGSizeMake(ITEM_SIZEw, ITEM_SIZEh);
    attributes.center = CGPointMake(_center.x +_radius *
                                    cosf(2 * path.item * M_PI / _cellCount),
                                    _center.y + _radius *
                                    sinf(2 * path.item * M_PI/ _cellCount));
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
    for (NSInteger i=0; i< self.cellCount; i++)
    {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    
    return attributes;
}

-(UICollectionViewLayoutAttributes *) initialLayoutAttributesForInsertedItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return attributes;
    
}

-(UICollectionViewLayoutAttributes *) finalLayoutAttributesForDeletedItemAtIndexPath:itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
    
}


@end
