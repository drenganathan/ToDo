//
//  ToDoTableViewController.h
//  ToDo
//
//  Created by Renganathan D on 8/11/13.
//  Copyright (c) 2013 Renganathan D. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewController : UITableViewController  <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *toDoList;

- (IBAction) Add:(id)sender;

@end
