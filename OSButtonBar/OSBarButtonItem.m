//
//  OSBarButtonItem.m
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSBarButtonItem.h"
#import "OSButtonBar.h"

@interface OSButtonBar (OSBarButtonItem)

/**
 * Called by button items when they have been tapped
 */
-(void)buttonTapped:(OSBarButtonItem*)item;

@end

@interface OSBarButtonItem ()
{
    UITapGestureRecognizer* tapGesture;
}

@end
@implementation OSBarButtonItem


-(void)updateConstraints
{
    [super updateConstraints];
    
    UIView* view = _label;
    
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];

   
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(instancetype)initWithTitle:(NSString *)title andBackgroundColour:(UIColor*)colour
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 100, 100)])
    {
        [self commonInitWithTitle:title];
        self.backgroundColor = colour;
    }
    
    return self;
}

-(instancetype)initWithTitle:(NSString *)title
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 100, 100)])
    {
        [self commonInitWithTitle:title];
    }
    
    return self;
}

-(void)commonInitWithTitle:(NSString*)title
{
    [self commonInit];
    
    _title = title;
    //self.backgroundColor = [UIColor blueColor];
    self.clipsToBounds = YES;
    UILabel* label = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:label];
    _label = label;
    _label.text = title;
    //        [_label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
    //        [_label setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
    //
    //   self.translatesAutoresizingMaskIntoConstraints = NO;
     _label.translatesAutoresizingMaskIntoConstraints= NO;
    _label.textAlignment = NSTextAlignmentCenter;

}

-(void)didMoveToSuperview
{
    if (self.superview)
    {
        if (!tapGesture)
        {
            tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
            [self addGestureRecognizer:tapGesture];
        }
    }
    else
    {
        [self removeGestureRecognizer:tapGesture];
        tapGesture = nil;
    }
}

-(void)commonInit
{

}

-(void)tapped
{
    [_parent buttonTapped:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
