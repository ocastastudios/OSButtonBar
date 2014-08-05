//
//  OSButtonBar.m
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSButtonBar.h"

@interface OSButtonBar (OSBarButtonItem)

/**
 * Called by button items when they have been tapped
 */
-(void)buttonTapped:(OSBarButtonItem*)item;

@end

@interface OSButtonBar (OSButtonBarLayout)

/**
 * Called when layout instance has refreshed itself and has layed out all items
 */
-(void)layoutUpdated;


@end
@implementation OSButtonBar

-(instancetype)initWithLayout:(OSButtonBarLayout *)layout andTapHandler:(OSBarButtonPressed)tapHandler;
{
    self = [super init];
    if (self)
    {
        // Initialization code
        self.layout = layout;
        self.tapHandler = tapHandler;
        
        [self commonInit];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self commonInit];
    }
    
    return self;
}

-(void)commonInit
{
    self.animateButtonTaps = YES;
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

-(void)orientationChanged:(NSNotification *)notification
{
   // UIDeviceOrientation deviceOrientation = [[UIDevice currentDevice] orientation];

    [self.layout invalidateLayout];
}

-(void)buttonTapped:(OSBarButtonItem *)item
{
    NSUInteger index = [_items indexOfObject:item];
    
    if (_tapHandler)
    {
        _tapHandler(self,item,index);
    }
    
    __block OSBarButtonItem* _item = item;
    
    if (_animateButtonTaps)
    {
        [UIView animateWithDuration:0.2 animations:^{
            _item.alpha = 0.5;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                
            } completion:^(BOOL finished) {
                _item.alpha = 1;
            }];
        }];
    }
}

-(CGSize)intrinsicContentSize
{
    return _layout.intrinsicContentSize;
}

-(void)setItems:(NSArray *)items
{
    //remove existing
    for(OSBarButtonItem* item in _items)
    {
        item.parent = nil;
        [item removeFromSuperview];
    }
    
    //add new items
    
    _items = items;
    for(OSBarButtonItem* item in items)
    {
        item.parent = self;
        [self addSubview:item];
    }
    
    [_layout prepareLayoutForItems:items];
    
    NSAssert(_layout, @"No layout instance set");
    
}

-(void)setLayout:(OSButtonBarLayout *)layout
{
    _layout = layout;
    layout.parent = self;
    [layout prepareLayoutForItems:self.items];
    
}



-(void)layoutUpdated
{
    NSUInteger index=0;
    
    for (OSButtonBar* barItem in _items)
    {
        CGRect rect = [_layout rectForItemAtIndex:index];
        barItem.frame = rect;
        index++;
    }
    
    [self invalidateIntrinsicContentSize];
}


@end
