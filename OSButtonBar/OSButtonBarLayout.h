//
//  OSButtonBarLayout.h
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OSButtonBar;

@interface OSButtonBarLayout : NSObject

@property (nonatomic,weak) OSButtonBar* parent;
@property (nonatomic,strong) NSArray* layoutRects;

/**
 * Override this to provide the minimum size for the content
 */
@property (nonatomic,readonly) CGSize intrinsicContentSize;

/**
 * Calculate rects for all items. Call addRect for each calculated rect.
 * NB! be sure to call [super prepareLayoutWithItems:] AFTER calculations
 */
-(void)prepareLayoutForItems:(NSArray*)items;

/**
 * Returns the rect for the item at the specified position
 */
-(CGRect)rectForItemAtIndex:(NSUInteger)index;

/**
 * Returns the size of the area required to show all items
 */
-(CGSize)contentSize;

/**
 * Causes the calculated rects to be destroyed and recalculated
 */
-(void)invalidateLayout;


#pragma mark -
#pragma mark Methods to be used by INHERITING CLASS ONLY!

/**
 * Called by inherting class when it needs to add an items layout rect.
 * Be sure to call this in the correct order for item layout.
 */
-(void)addRect:(CGRect)rect;


@end
