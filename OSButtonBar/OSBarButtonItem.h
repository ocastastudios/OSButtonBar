//
//  OSBarButtonItem.h
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import <UIKit/UIKit.h>


@class OSButtonBar;

@interface OSBarButtonItem : UIView


-(instancetype)initWithTitle:(NSString *)title andBackgroundColour:(UIColor*)colour;
-(instancetype)initWithTitle:(NSString*)title;

@property (nonatomic,strong) NSString* title;

/**
 * <#Comment#>
 */
@property (nonatomic,weak) UILabel* label;

/**
 * The parent bar of this button
 */
@property (nonatomic,weak) OSButtonBar* parent;


@end
