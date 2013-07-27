//
//  GAView.m
//  GeneralApp
//
//  Created by Denny C. Dai on 7/19/2013.
//  Copyright (c) 2013 Denny C. Dai. All rights reserved.
//

#import "GAView.h"

@implementation GAView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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

-(void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAView::encodeRestorableStateWithCoder");
    [super encodeRestorableStateWithCoder:coder];
    
//    NSRange range = [self selectionRange];
//    [coder encodeInt:range.length forKey:kMyTextViewSelectionRangeLength];
//    [coder encodeInt:range.location forKey:kMyTextViewSelectionRangeLocation];
}

-(void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    NSLog(@"GAView::decodeRestorableStateWithCoder");
    [super decodeRestorableStateWithCoder:coder];
//    if ([coder containsValueForKey:kMyTextViewSelectionRangeLength] &&
//        [coder containsValueForKey:kMyTextViewSelectionRangeLocation]) {
//        NSRange range;
//        range.length = [coder decodeIntForKey:kMyTextViewSelectionRangeLength];
//        range.location = [coder decodeIntForKey:kMyTextViewSelectionRangeLocation];
//        if (range.length > 0)
//            [self setSelectionRange:range];
//    }
//}

}


-(void)tintColorDidChange
{
    NSLog(@"tintColorDidChange");
}

@end
