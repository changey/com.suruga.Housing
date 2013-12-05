//
//  InterestedInVCViewController.m
//  com.suruga.houseSelect
//
//  Created by yasho on 10/7/13.
//  Copyright (c) 2013 MIT-CDB. All rights reserved.
//

#import "InterestedInVC.h"

@interface InterestedInVC ()

@end

@implementation InterestedInVC

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
    NSLog(@"ENTERING VIEWDIDLOAD OF INTERESTEDINVC -----------------------------------------");
    
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    self.user = [[[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy] objectAtIndex:0];
    
    NSLog(@"EXITING VIEWDIDLOAD OF INTERESTEDINVC -----------------------------------------");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSString *interestedIn = [self.user valueForKey:@"interestedIn"];
    NSLog(@"user is interested in %@", interestedIn);
    NSLog(@"%i", [interestedIn isEqualToString:@"Renting"]);
    if ([interestedIn isEqualToString:@"Buying"]){
        UITableViewCell *selectedCell = [self.interestedInTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else if ([interestedIn isEqualToString:@"Renting"]){
        NSLog(@"In the Renting if statement");
        UITableViewCell *selectedCell = [self.interestedInTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"ENTERING DIDSELECTROWATINDEXPATH OF INTERESTEDINVC -----------------------------------------");
    NSInteger *selectedCellRow; NSInteger *deselectedCellRow;
    
    if (indexPath.row == 0){
        [self.user setValue:@"Buying" forKey:@"interestedIn"];
        selectedCellRow = 0; deselectedCellRow = 1;
    } else if (indexPath.row == 1){
        [self.user setValue:@"Renting" forKey:@"interestedIn"];
        selectedCellRow = 1; deselectedCellRow = 0;
    }
    
    UITableViewCell *selectedCell = [self.interestedInTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:selectedCellRow inSection:0]];
    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    UITableViewCell *deselectedCell = [self.interestedInTable cellForRowAtIndexPath:[NSIndexPath indexPathForRow:deselectedCellRow inSection:0]];
    deselectedCell.accessoryType = UITableViewCellAccessoryNone;
    
    
    NSLog(@"EXITING DIDSELECTROWATINDEXPATH OF INTERESTEDINVC -----------------------------------------");
    
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

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

/*
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
