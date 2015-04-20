//
//  ViewController.m
//  HorizontalScroll
//
//  Created by Me on 19/04/2015.
//  Copyright (c) 2015 ASample. All rights reserved.
//

// Project intended to be run on an iPad to test VoiceOver navigation

#import "ViewController.h"

#import "CustomScrollView.h"

@interface ViewController ()
@property (strong, nonatomic) UIScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupScrollViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupScrollViews
{
    [self initializeRandomColors];

    // a standard scroll view
    UIScrollView *scrollView1 = [self createScrollViewOfClass:[UIScrollView class] atOriginY:100.f];
    [self.view addSubview:scrollView1];
    
    // a scroll view implementing UIAccessibilityContainer protocol
    UIScrollView *scrollView2 = [self createScrollViewOfClass:[CustomScrollView class] atOriginY:450.f];
    [self.view addSubview:scrollView2];
}

- (UIScrollView *)createScrollViewOfClass:(Class)scrollViewClass atOriginY:(CGFloat)originY
{
    CGRect viewFrame = self.view.frame;
    CGRect scrollFrame = CGRectMake(0.f, originY, viewFrame.size.width, 250.f);
    UIScrollView *scrollView = [[scrollViewClass alloc] initWithFrame:scrollFrame];
    scrollView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [self addSubviewsToScrollView:scrollView];
    return scrollView;
}

- (void)addSubviewsToScrollView:(UIScrollView *)scrollView
{
    CGRect scrollViewFrame = scrollView.frame;
    CGFloat x = 0.f;
    CGFloat y = 0.f;
    CGFloat width = 300.f;
    CGFloat height = scrollViewFrame.size.height;
    int nViews = 7;
    
    for (int i = 0; i < nViews; ++i)
    {
        CGRect frame = CGRectMake(x + i * width, y, width, height);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = [self randomColor];
        view.isAccessibilityElement = YES;
        view.accessibilityLabel = [NSString stringWithFormat:@"%d of %d", i + 1, nViews];
        [scrollView addSubview:view];
    }
    scrollView.contentSize = CGSizeMake(nViews * width, height);
}

- (void)initializeRandomColors
{
    srand48(0); // don't randomize the colors seed
}

- (UIColor *)randomColor
{
    CGFloat red = drand48();
    CGFloat green = drand48();
    CGFloat blue = drand48();
    return [UIColor colorWithRed:red green:green blue:blue alpha:0.8];
}

@end
