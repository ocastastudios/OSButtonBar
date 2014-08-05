//
//  OSButtonBarTestViewController.m
//  OSButtonBarExample
//
//  Created by Chris Birch on 04/08/2014.
//  Copyright (c) 2014 Ocasta Studios. All rights reserved.
//

#import "OSButtonBarTestViewController.h"
#import "OSButtonBar.h"

@interface OSButtonBarTestViewController ()
@property (weak, nonatomic) IBOutlet OSButtonBar *barButtons;

@end

@implementation OSButtonBarTestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    OSButtonBarLayout* buttonLayout = [[OSButtonBarFlowLayout alloc] init];
    _barButtons.layout = buttonLayout;
    
    NSArray* buttons = @[
                         
                         [[OSBarButtonItem alloc] initWithTitle:@"My Playlist" andBackgroundColour:[UIColor colorWithRed:0.666 green:0.764 blue:0.294 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Drama" andBackgroundColour:[UIColor colorWithRed:0.254 green:0.584 blue:0.819 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Factual" andBackgroundColour:[UIColor colorWithRed:0.607 green:0.082 blue:0.47 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Childrens" andBackgroundColour:[UIColor colorWithRed:0.882 green:0.607 blue:0.172 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Entertainment" andBackgroundColour:[UIColor colorWithRed:0.996 green:0.819 blue:0.898 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Formats" andBackgroundColour:[UIColor colorWithRed:0.984 green:0.901 blue:0.2 alpha:1]],
                         [[OSBarButtonItem alloc] initWithTitle:@"Music" andBackgroundColour:[UIColor colorWithRed:0.243 green:0.337 blue:0.627 alpha:1]],
//                         [[OSBarButtonItem alloc] initWithTitle:@"<#painful#>" andBackgroundColour:<#colour#>],
                         ];
    _barButtons.items = buttons;
    
 
    _barButtons.tapHandler = ^(OSButtonBar *buttonBar, OSBarButtonItem *button, NSUInteger buttonIndex) {
        
    };

    [UILabel appearanceWhenContainedIn:[OSButtonBar class], nil].textColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
