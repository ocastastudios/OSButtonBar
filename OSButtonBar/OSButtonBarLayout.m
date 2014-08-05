//
//  OSButtonBarLayout.m
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSButtonBarLayout.h"
#import "OSButtonBar.h"

@interface OSButtonBar (OSButtonBarLayout)

/**
 * Called when layout instance has refreshed itself and has layed out all items
 */
-(void)layoutUpdated;


@end

@interface OSButtonBarLayout ()
{
    NSMutableArray* _layoutRects;
}

@end

@implementation OSButtonBarLayout

-(CGSize)contentSize
{
    return CGSizeZero;
}

-(CGSize)intrinsicContentSize
{
    return CGSizeMake(UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric);
}

-(void)invalidateLayout
{
    _layoutRects = [[NSMutableArray alloc] init];
    [self prepareLayoutForItems:_parent.items];
    
    
}

-(CGRect)rectForItemAtIndex:(NSUInteger)index
{
    return ((NSValue*)_layoutRects[index]).CGRectValue;
}

-(void)prepareLayoutForItems:(NSArray *)items
{
    [_parent layoutUpdated];
}


-(void)addRect:(CGRect)rect
{
    if (!_layoutRects)
        _layoutRects = [NSMutableArray new];
    [_layoutRects addObject: [NSValue valueWithCGRect:rect]];
}

@end
