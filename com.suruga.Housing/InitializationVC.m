//
//  InitializationVC.m
//  com.suruga.Housing
//
//  Created by yasho on 11/24/13.
//  Copyright (c) 2013 MIT. All rights reserved.
//  Page control code adapted from Jay Chulani https://github.com/hackin247/UIPageViewController


#import "InitializationVC.h"

@interface InitializationVC ()


//UI related
@property (weak, nonatomic) IBOutlet UIImageView *surugaBackgroundLogo;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBarTitle;

//Navigation related
@property (retain, nonatomic) NSArray *pages;
@property (strong, nonatomic) UIPageViewController *pageController;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation InitializationVC

-(void)setNavBar:(NSString *)title{
        self.navBarTitle.title = title;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self instantiateViewControllersFromStoryboard];
    [self setUI];
}

-(void)setUI
{
    self.surugaBackgroundLogo.layer.opacity=0.05;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(skipInitialization)
//                                                 name:userIsAuthenticated
//                                               object:nil];

}
//
//-(void)skipInitialization{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

- (void)instantiateViewControllersFromStoryboard
{
    WelcomeVC *page1 = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"Welcome"];
    page1.delegate = self;
    OverviewVC *page2 = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"Overview"];
    page2.delegate = self;
    TasksVC *page3 = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"Tasks"];
    page3.delegate = self;
    PINVC *page4 = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"PIN"];
    page4.delegate = self;
    // load the view controllers in our pages array
    self.pages = [[NSArray alloc] initWithObjects:page1, page2, page3, page4, nil];

    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageController setDelegate:self];
    [self.pageController setDataSource:self];
    
    [[self.pageController view] setFrame:[[self view] bounds]];
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:0]];
    [self.pageControl setCurrentPage:0];
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    
    [self.view addSubview:self.pageControl];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
    [self.view sendSubviewToBack:[self.pageController view]];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];    // get the index of the current view controller on display
    [self.pageControl setCurrentPage:self.pageControl.currentPage+1];                   // move the pageControl indicator to the next page
    
    // check if we are at the end and decide if we need to present the next viewcontroller
    if ( currentIndex < [self.pages count]-1) {
        return [self.pages objectAtIndex:currentIndex+1];                   // return the next view controller
    } else {
        return nil;                                                         // do nothing
    }
}


- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger currentIndex = [self.pages indexOfObject:viewController];    // get the index of the current view controller on display
    [self.pageControl setCurrentPage:self.pageControl.currentPage-1];                   // move the pageControl indicator to the next page
    
    // check if we are at the beginning and decide if we need to present the previous viewcontroller
    if ( currentIndex > 0) {
        return [self.pages objectAtIndex:currentIndex-1];                   // return the previous viewcontroller
    } else {
        return nil;                                                         // do nothing
    }
}

- (void)changePage:(id)sender {
    
    UIViewController *visibleViewController = self.pageController.viewControllers[0];
    NSUInteger currentIndex = [self.pages indexOfObject:visibleViewController];
    
    NSArray *viewControllers = [NSArray arrayWithObject:[self.pages objectAtIndex:self.pageControl.currentPage]];
    
    if (self.pageControl.currentPage > currentIndex) {
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    } else {
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
        
    }
}


@end
