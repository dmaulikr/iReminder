//
//  PillListViewController.m
//  iReminder
//
//  Created by Ruben Fernandez Fuste on 16/11/13.
//  Copyright (c) 2013 Rff Systems. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PillListViewController.h"
#import "PillItem.h"
#import "AddPillViewController.h"

@interface PillListViewController ()
@property NSMutableArray *pillList;

@end

@implementation PillListViewController


/* 
 * Creem algunes dades de test per a mostrar a la llista inicial
 *
 */
- (void) loadInitialData
{
    /*
    PillItem *pill1 = [[PillItem alloc] init];
    pill1.pillName = @"Tiroxina";
    [self.pillList addObject:pill1];
    
    PillItem *pill2 = [[PillItem alloc] init];
    pill2.pillName = @"Fixador";
    [self.pillList addObject:pill2];
    
    PillItem *pill3 = [[PillItem alloc] init];
    pill3.pillName = @"Calci";
    [self.pillList addObject:pill3];
     */
}


/*
 * Punt de retorn desde alguna escena cap a la llista principal.
 * Aquí es on tornarem despres i podrem executar algun tipus de codi. 
 */
- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{

    AddPillViewController *source = [segue sourceViewController];
    PillItem *pill = source.pill;
    if (pill != nil) {
        // Comming from add new pill
        [self.pillList addObject:pill];
        
        // now I have to order the list
        [self.pillList sortUsingDescriptors:
             [NSArray arrayWithObjects:
             [NSSortDescriptor sortDescriptorWithKey:@"time" ascending:YES], nil]];

        // repaint the data table
        [self.tableView reloadData];
    }
}

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
    
    self.pillList =[[NSMutableArray alloc] init];
    
    
    //[self loadInitialData];                       //Ja no carreguem les dades inicials

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Retun the number of rows in the section.
    return [self.pillList count];
}


/* 
 * Configuració de la cel.la de la taula.
 * IMPORTANT: El CellIdentifier ha de ser el mateix que es posi al Storyboard
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] ;

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    CALayer* CellLayer = cell.layer;
    [CellLayer setCornerRadius:12.0f];
    [CellLayer setMasksToBounds:YES];
    [CellLayer setBorderWidth:1.0f];


    // Configure the cell...
    PillItem *pill = [self.pillList objectAtIndex:indexPath.row];
    cell.textLabel.text = pill.pillName;
    
    
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm a"];
    
    cell.detailTextLabel.text = [outputFormatter stringFromDate:pill.time];
  
    if(pill.taken)
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    else
    {
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source

        // Delete selected element.
        [self.pillList removeObjectAtIndex:indexPath.row];
        
        // Repaint table data again
        [self.tableView reloadData];
    }
}

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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

    
}


#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    PillItem *tappedPill = [self.pillList objectAtIndex:indexPath.row];
    tappedPill.taken = !tappedPill.taken;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    
    
    
}

@end
