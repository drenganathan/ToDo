//
//  ToDoTableViewController.m
//  ToDo
//
//  Created by Renganathan D on 8/11/13.
//  Copyright (c) 2013 Renganathan D. All rights reserved.
//

#import "ToDoTableViewController.h"
#import "ToDoCell.h"

@interface ToDoTableViewController ()

@end

@implementation ToDoTableViewController

@synthesize toDoList = _toDoList;

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
    
    self.navigationItem.title = @"ToDo List";
    
    UINib *toDoNib = [UINib nibWithNibName:@"ToDoCell" bundle:nil];
    [self.tableView registerNib:toDoNib forCellReuseIdentifier:@"ToDoCell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleBordered  target:self action:@selector(Edit:)];
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Add:)];
    
    self.toDoList = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"ToDoList"]];
    NSLog(@"Count is %i", self.toDoList.count);
    
    if(self.toDoList.count == 0) {
        NSMutableArray *myArray = [[NSMutableArray alloc] initWithObjects:@"Apples", @"Oranges", @"Pears", @"Fruit", nil];
        [[NSUserDefaults standardUserDefaults] setObject:myArray forKey:@"ToDoList"];
        self.toDoList = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults] objectForKey:@"ToDoList"]];

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.toDoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ToDoCell";
    ToDoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    //cell.textLabel.text = [self.toDoList valueForKey:[self.toDoList objectAtIndex:indexPath.row]];
    cell.toDoItem.text = [self.toDoList objectAtIndex:[indexPath row]];
    //NSLog(@"Cell is %@", [self.toDoList objectAtIndex:indexPath.row]);
    
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
        [self.toDoList removeObjectAtIndex:indexPath.row];
		[self.tableView reloadData];
    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        //[self.toDoList insertObject:@"Mac Mini" atIndex:[self.toDoList count]];
//		[self.tableView reloadData];
//    }   
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	NSString *item = [self.toDoList objectAtIndex:fromIndexPath.row];
	[self.toDoList removeObject:item];
	[self.toDoList insertObject:item atIndex:toIndexPath.row];
    [[NSUserDefaults standardUserDefaults] setObject:self.toDoList forKey:@"ToDoList"];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(IBAction)Add:(id)sender
{
    
}

- (IBAction) Edit:(id)sender{
    NSLog(@"Editing is %hhd", self.editing);
	if(self.editing)
	{
		[super setEditing:NO animated:NO];
		[self.tableView setEditing:NO animated:NO];
		[self.tableView  reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Edit"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleBordered];
	}
	else
	{
		[super setEditing:YES animated:YES];
		[self.tableView  setEditing:YES animated:YES];
		[self.tableView  reloadData];
		[self.navigationItem.leftBarButtonItem setTitle:@"Done"];
		[self.navigationItem.leftBarButtonItem setStyle:UIBarButtonItemStyleDone];
	}
}

@end
