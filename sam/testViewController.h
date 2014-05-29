//
//  testViewController.h
//  sam
//
//  Created by BSA Univ3 on 27/05/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface testViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIView *pop;
@property AppDelegate *appdelegate;
- (IBAction)next:(id)sender;
- (IBAction)SAVE:(id)sender;
- (IBAction)fetch:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextField *mob;
-(NSArray *)fetches;
@property (strong, nonatomic) IBOutlet UITableView *cellcontacts;

@end
