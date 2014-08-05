//
//  OSButtonBarFlowLayout.h
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSButtonBarLayout.h"

typedef enum
{
    OSButtonBarFlowLayoutHorizontalSingleLine,
    //Not implemented yet
    OSButtonBarFlowLayoutHorizontalScroll,
    //Not implemented yet
    OSButtonBarFlowLayoutVerticalScroll,
    
} OSButtonBarFlowLayoutType;

@interface OSButtonBarFlowLayout : OSButtonBarLayout


@property (nonatomic,assign) OSButtonBarFlowLayoutType type;

@property (nonatomic,assign) float spacingHorizontal;
@property (nonatomic,assign) float spacingVertical;

@end
