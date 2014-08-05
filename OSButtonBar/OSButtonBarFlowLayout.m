//
//  OSButtonBarFlowLayout.m
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSButtonBarFlowLayout.h"
#import "OSBarButtonItem.h"
#import "OSButtonBar.h"

@interface OSButtonBarFlowLayout ()
{
    CGSize contentSize;
}

@end
@implementation OSButtonBarFlowLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        _spacingHorizontal = 2;
    }
    return self;
}

-(void)prepareLayoutForItems:(NSArray *)items
{
    switch (_type)
    {
        case OSButtonBarFlowLayoutHorizontalSingleLine:
            [self horizontalSingleLineLayoutForItems:items];
            break;
            
        default:
            break;
    }
    
    //Now call super
    [super prepareLayoutForItems:items];
}

/**
 * Lays out buttons with equal width in a horizontal line, increasing the height of the
 * bar to accomidate long titles
 */
-(void)horizontalSingleLineLayoutForItems:(NSArray*)items
{
    CGRect barRect = self.parent.bounds;
    
    CGFloat maxHeight=0;
    CGFloat itemWidth = (barRect.size.width / items.count) - (_spacingHorizontal - (_spacingHorizontal / items.count));
    
    //In the first pass we work out the max height
    for (OSBarButtonItem* item in items)
    {
        CGRect rect = item.frame;
        rect.size.width = itemWidth;
        item.label.numberOfLines = 0;
        item.label.preferredMaxLayoutWidth = itemWidth;
        
        
        [item setNeedsUpdateConstraints];
        [item updateConstraintsIfNeeded];
        
        CGSize size = [item systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        rect.size.height = size.height;
        item.frame = rect;
        maxHeight = MAX(maxHeight,item.frame.size.height);
    }

    CGFloat nextX=0;
    
    //In the first pass we work out the max height
    for (OSBarButtonItem* item in items)
    {
        CGRect rect = item.frame;
        rect.origin.x = nextX;
        rect.origin.y = 0;
        rect.size.height = maxHeight;
        rect.size.width = itemWidth;
        item.frame = rect;
        
        [item setNeedsLayout];
        [item layoutIfNeeded];
        
        nextX+= itemWidth + _spacingHorizontal;
        
//        rect.size.width = 100;
//        rect.size.height = 100;
        [self addRect:rect];

    }
    
  //  maxHeight = 100;
    contentSize = CGSizeMake(self.parent.bounds.size.width, maxHeight);

    
    

}

-(CGSize)intrinsicContentSize
{
    return contentSize;
}

-(CGSize)contentSize
{
    return contentSize;
}

@end
