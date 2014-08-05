//
//  OSButtonBar.h
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSBarButtonItem.h"
#import "OSButtonBarLayout.h"
#import "OSButtonBarFlowLayout.h"

typedef void(^OSBarButtonPressed)(OSButtonBar* buttonBar, OSBarButtonItem* button, NSUInteger buttonIndex);

@interface OSButtonBar : UIView

-(instancetype)initWithLayout:(OSButtonBarLayout*)layout andTapHandler:(OSBarButtonPressed)tapHandler;

/**
 * if YES then we animate taps on buttons. If you wish to provide your own animations,
 * Do so in the tapHandler and set this property to NO.
 * Defaults to YES.
 */
@property (nonatomic,assign) BOOL animateButtonTaps;

/**
 * The block that is called when button is tapped
 */
@property (nonatomic,copy) OSBarButtonPressed tapHandler;

/**
 * The object that is repsonsible for laying out the items.
 */
@property (nonatomic,strong) OSButtonBarLayout* layout;

/**
 * The bar items themselves
 */
@property (nonatomic,strong) NSArray* items;

@property (nonatomic,weak) UIScrollView* contentView;



@end
