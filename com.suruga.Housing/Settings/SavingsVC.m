//
//  SavingsVC.m
//  com.suruga.houseSelect
//
//  Created by yasho on 10/8/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import "SavingsVC.h"

@interface SavingsVC ()

@end

@implementation SavingsVC

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
    
     self.savingsTxt.backgroundColor = [UIColor yellowColor];
}

-(void)dismissKeyboard {
    [self.savingsTxt resignFirstResponder];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if (self.verbose) {NSLog(@"------------------------------------------------------------- Begin ViewDidAppear SavingsVC");}
    if (self.verbose) {NSLog(@"[[self.user valueForKey:@\"savings\"]  description] is %@", [[self.user valueForKey:@"savings"]  description]);}
    
    self.savingsTxt.text = [[self.user valueForKey:@"savings"] description];
    [self.savingsTxt becomeFirstResponder];
    
    if (self.verbose) {NSLog(@"------------------------------------------------------------- End ViewDidAppear SavingsVC");}
}

- (void)viewWillDisappear:(BOOL)animated {
    if (self.verbose) {NSLog(@"------------------------------------------------------------- Begin ViewWillDisappear SavingsVC");}
    [super viewWillDisappear:animated];
    if (self.verbose) {NSLog(@"[self.savingsTxt.text integerValue] is %i", [self.savingsTxt.text integerValue]);}
    [self.user setValue:[NSNumber numberWithInt:[self.savingsTxt.text integerValue]] forKey:@"savings"];
    if (self.verbose) {NSLog(@"The updated [[self.user valueForKey:@\"savings\"] description] %@", [[self.user valueForKey:@"savings"] description]);}
    if (self.verbose) {NSLog(@"------------------------------------------------------------- End ViewWillDisappear SavingsVC");}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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











