//
//  MonthlyVCViewController.m
//  com.suruga.houseSelect
//
//  Created by yasho on 10/8/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import "MonthlyVC.h"

@interface MonthlyVC ()

@end

@implementation MonthlyVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.verbose = TRUE;
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.user = [[[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy] objectAtIndex:0];
    
    //dismiss keyboard if user taps anywhere else
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
     self.monthlyBudgetTxt.backgroundColor = [UIColor yellowColor];
}

-(void)dismissKeyboard {
    [self.monthlyBudgetTxt resignFirstResponder];
}

- (void) viewDidAppear:(BOOL)animated{
    if (self.verbose) {NSLog(@" ");}
    
    [super viewDidAppear:animated];

    if (self.verbose) {NSLog(@"------------------------------------------------------------- Begin ViewDidAppear MonthlyVC");}
    if (self.verbose) {NSLog(@"[[self.user valueForKey:@\"monthlyBudget\"]  description] is %@", [[self.user valueForKey:@"monthlyBudget"]  description]);}
    self.monthlyBudgetTxt.text = [[self.user valueForKey:@"monthlyBudget"]  description];
    [self.monthlyBudgetTxt becomeFirstResponder];
    
    if (self.verbose) {NSLog(@"------------------------------------------------------------- End ViewDidAppear MonthlyVC");}
}


- (void)viewWillDisappear:(BOOL)animated {
    if (self.verbose) {NSLog(@"------------------------------------------------------------- Begin ViewWillDisappear MonthlyVC");}
    [super viewWillDisappear:animated];
    
    if (self.verbose) {NSLog(@"[self.monthlyBudgetTxt.text integerValue] is %i", [self.monthlyBudgetTxt.text integerValue]);}
    [self.user setValue:[NSNumber numberWithInt:[self.monthlyBudgetTxt.text integerValue]] forKey:@"monthlyBudget"];
    if (self.verbose) {NSLog(@"The updated [[self.user valueForKey:@\"monthlyBudget\"] description] %@", [[self.user valueForKey:@"monthlyBudget"] description]);}
    
    if (self.verbose) {NSLog(@"------------------------------------------------------------- End ViewWillDisappear MonthlyVC");}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Core Data

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


@end
