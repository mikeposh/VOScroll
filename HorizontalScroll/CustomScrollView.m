//
//  CustomScrollView.m
//  HorizontalScroll
//
//  Created by Me on 20/04/2015.
//  Copyright (c) 2015 ASample. All rights reserved.
//

// A customized scroll view which implements the UIAccessibilityContainer protocol

#import "CustomScrollView.h"

@interface CustomScrollView ()

// will need store strong pointers, so assume subviews will never be removed piecemeal
@property (strong, nonatomic) NSMutableArray *subviews;

@end

@implementation CustomScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    NSLog(@"Initializing custom scroll view");
    self = [super initWithFrame:frame];
    if (self)
    {
        _subviews = [NSMutableArray new];
    }
    return self;
}

- (void)addSubview:(UIView *)view
{
    [self.subviews addObject:view];
    [super addSubview:view];
}

#pragma mark - Implement UIAccessibilityContainer protocol

- (BOOL)isAccessibilityElement
{
    return NO;
}

- (NSInteger)accessibilityElementCount
{
    return [self.subviews count];
}

- (NSInteger)indexOfAccessibilityElement:(id)element
{
    return [self.subviews indexOfObject:element];
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
    return [self.subviews objectAtIndex:index];
}


@end
