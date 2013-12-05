//
//  SettingsVC.m
//  com.suruga.houseSelect
//
//  Created by yasho on 9/27/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import "SettingsVC.h"

@interface SettingsVC ()

@end

@implementation SettingsVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"ENTERED VIEWDIDLOAD OF SETTINGSVC -----------------------------------------");

    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.user = [[[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy] objectAtIndex:0];

    
    NSLog(@"EXITING VIEWDIDLOAD OF SETTINGSVC -----------------------------------------");

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Core Data

- (void) viewDidAppear:(BOOL)animated{
    //TODO NEXT --> Get the Detail of the City label in Settings to display the correct city.
    NSLog(@"ENTERED VIEWDIDAPPEAR OF SETTINGSVC -----------------------------------------");
    
    for (NSInteger cellRow = 0; cellRow < [self.tableView numberOfRowsInSection:0]; cellRow++){
        NSLog(@"Entering for loop, cellRow = %i", cellRow);
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:cellRow inSection:0]];
        NSLog(@"[cell reuseIdentifier] is %@", [cell reuseIdentifier]);
        NSLog(@"The city in [[self.user valueForKey:[cell reuseIdentifier]] description] is: %@", [[self.user valueForKey:[cell reuseIdentifier]] description]);
        cell.detailTextLabel.text = [[self.user valueForKey:[cell reuseIdentifier]] description];
        NSLog(@"Exiting for loop, cellRow = %i", cellRow);
    }
    
    NSLog(@"EXITING VIEWDIDAPPEAR OF SETTINGSVC -----------------------------------------");

    [self.tableView reloadData];
    if ([self.user valueForKey:@"city"] != NULL && [self.user valueForKey:@"interestedIn"] != NULL && [[self.user valueForKey:@"monthlyBudget"] integerValue] > 0 && [[self.user valueForKey:@"savings"] integerValue] > 0){
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Task 1 Complete!"
                                                      message:@"Congratulations! You completed Task 1. Please check out \"Guide\" for Task 2!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
        [self.user setValue:[NSNumber numberWithInt:2]forKey:@"appState"];

        
    }
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

- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    if ([self.user valueForKey:@"city"] != NULL && [self.user valueForKey:@"interestedIn"] != NULL && [[self.user valueForKey:@"monthlyBudget"] integerValue] > 0 && [[self.user valueForKey:@"savings"] integerValue] > 0){
        [self.user setValue:[NSNumber numberWithInt:2]forKey:@"appState"];

    }
}

#pragma mark - Table view data source
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
