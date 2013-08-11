//
//  ToDoCell.m
//  ToDo
//
//  Created by Renganathan D on 8/11/13.
//  Copyright (c) 2013 Renganathan D. All rights reserved.
//

#import "ToDoCell.h"

@implementation ToDoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
