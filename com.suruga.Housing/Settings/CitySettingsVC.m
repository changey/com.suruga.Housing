//
//  CitySettingsVC.m
//  com.suruga.houseSelect
//
//  Created by yasho on 9/27/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import "CitySettingsVC.h"


@interface CitySettingsVC ()

@end

@implementation CitySettingsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"ENTERING VIEWDIDLOAD OF CITYSETTINGSVC -----------------------------------------");

    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.user = [[[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy] objectAtIndex:0];
    
    NSLog(@"EXITING VIEWDIDLOAD OF CITYSETTINGSVC -----------------------------------------");
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSInteger initCityRow = [[self.user valueForKey:@"cityRow"] integerValue];
    NSLog(@"initCityRow is %i", initCityRow);
    UITableViewCell *initCell = [self.citiesTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:initCityRow inSection:0]];
    NSLog(@"initCell.textLabel.text is %@", initCell.textLabel.text);
    initCell.accessoryType = UITableViewCellAccessoryCheckmark;
    NSLog(@"Initial city cell's accessory type set to checkmark.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"-----------------------------------------ENTERING DidSelectRowAtIndexPath of CitySettingsVC ");

    NSInteger previousCityRow = [[self.user valueForKey:@"cityRow"] integerValue];
    NSLog(@"[self.user valueForKey:@\"city\"] is %@", [self.user valueForKey:@"city"]);
    NSLog(@"previousCityRow is %i", previousCityRow);
    
    UITableViewCell *previousCell = [self.citiesTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:previousCityRow inSection:0]];
    NSLog(@"previousCell.textLabel.text is %@", previousCell.textLabel.text);
    NSLog(@"previousCell == NULL is %i", previousCell == NULL);
    previousCell.accessoryType = UITableViewCellAccessoryNone;
    NSLog(@"previousCell's accessory type has been set to None.");
    
    
    UITableViewCell *newlySelectedCell = [self.citiesTable cellForRowAtIndexPath:indexPath];
    [self.user setValue:newlySelectedCell.textLabel.text forKey:@"city"];
    [self.user setValue:[NSNumber numberWithInt:indexPath.row] forKey:@"cityRow"];
    newlySelectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [self.tableView reloadData];
    NSLog(@"newlySelectedCell.textLabel.text is %@. [NSNumber numberWithInt:indexPath.row] is %i. User's city attribute value is updated.", newlySelectedCell.textLabel.text, [[NSNumber numberWithInt:indexPath.row] integerValue]);
    NSLog(@"Setting the accessory type of the new cell to Checkmark");
    
    NSLog(@"-----------------------------------------EXITING DidSelectRowAtIndexPath of CitySettingsVC ");

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
    static NSString *CellIdentifier = @"allcities";
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
