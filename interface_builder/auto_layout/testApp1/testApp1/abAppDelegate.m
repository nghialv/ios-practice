//
//  abAppDelegate.m
//  testApp1
//
//  Created by Denny C. Dai on 2013-05-28.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "abAppDelegate.h"

@implementation abAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
    
}

-(void)handleClick:(id)sender
{
    [(NSButton*)sender setTitle:@"this is a long text here"];
}

-(void)awakeFromNib
{
//    [self.window.contentView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.window.contentView removeConstraints:[self.window.contentView constraints]];

    
    NSDictionary* buttons = NSDictionaryOfVariableBindings(_leftBtn, _rightBtn);
    NSArray* cs = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[_leftBtn]-[_rightBtn(==_leftBtn)]" options:NSLayoutFormatAlignAllBaseline  metrics:nil views:buttons];

    NSLayoutConstraint* cs2 = [NSLayoutConstraint constraintWithItem:self.leftBtn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.window.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
    NSLayoutConstraint* cs3 = [NSLayoutConstraint constraintWithItem:self.leftBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.window.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.window.contentView addConstraints:cs];
    [self.window.contentView addConstraint:cs2];
    [self.window.contentView addConstraint:cs3];
    
    
    CGSize sz = self.leftBtn.intrinsicContentSize;
    NSLog(@"%f, %f", sz.width, sz.height);
    
    NSArray* constraints = [self.rightBtn constraintsAffectingLayoutForOrientation:NSLayoutConstraintOrientationHorizontal];
    [self.window visualizeConstraints:constraints];
    
    [self.leftBtn setTarget:self];
    [self.leftBtn setAction:@selector(handleClick:)];
}

@end
