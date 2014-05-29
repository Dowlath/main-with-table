//
//  testViewController.m
//  sam
//
//  Created by BSA Univ3 on 27/05/14.
//  Copyright (c) 2014 BSA Univ3. All rights reserved.
//

#import "testViewController.h"
#import "AppDelegate.h"

@interface testViewController ()
{
    NSMutableArray *array;
    NSArray *contact;
}
@end

@implementation testViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return array.count;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
   NSManagedObjectContext *cont=[array objectAtIndex:indexPath.row];
    
     [cell.textLabel setText:[NSString stringWithFormat:@"%@ \n %@",[cont valueForKey:@"address"], [cont valueForKey:@"mob"]]];
     [cell.detailTextLabel setText:[cont valueForKey:@"name"]];
//    
    // Configure the cell...
    
    return cell;
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    array= [[self fetches]mutableCopy];
    NSLog(@"fetch val=%@",[array description]);
     [self.pop setHidden:YES];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)next:(id)sender {
    [_pop setHidden:NO];
}

- (IBAction)SAVE:(id)sender {
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *contact=[NSEntityDescription insertNewObjectForEntityForName:@"Hello" inManagedObjectContext:appdelegate.managedObjectContext];
    [contact setValue:_address.text forKeyPath:@"address"];
     [contact setValue:_name.text forKeyPath:@"name"];
     [contact setValue:_mob.text forKeyPath:@"mob"];
    NSError *error=nil;
    if(![appdelegate.managedObjectContext save:&error])
    {
        NSLog(@"not saved");
    }
    array=[self fetches];
    [_cellcontacts reloadData];
    [_pop setHidden:YES];
 
}
-(NSArray *)fetches
{
    NSArray *contact=[[NSArray alloc]init];
    AppDelegate *appdelegate=[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *manage=appdelegate.managedObjectContext;
    NSFetchRequest *get=[[NSFetchRequest alloc]initWithEntityName:@"Hello"];
    contact=[[manage executeFetchRequest:get error:nil]mutableCopy];
    return contact;
   
  
//    NSEntityDescription *des=[NSEntityDescription entityForName:@"Hello" inManagedObjectContext:appdelegate.managedObjectContext];
}
- (IBAction)fetch:(id)sender {
    
    
}
//- (void)fetch {
//    AppDelegate *appdelegate =(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Contact" inManagedObjectContext:appdelegate.managedObjectContext];
//    
//    NSFetchRequest *fetch=[[NSFetchRequest alloc]init];
//    [fetch setEntity:entity];
//    NSMutableArray *get=[[appdelegate.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
//    for (NSManagedObject *obj in get)   {
//        [self.contacts addObject:obj];
//        
//        NSLog(@"Contact :%@\n",[obj valueForKey:@"firstname"]);
//        NSLog(@"Contact :%@\n",[obj valueForKey:@"lastname"]);
//        NSLog(@"Contact :%@\n",[obj valueForKey:@"phoneno"]);
//    }
//    


@end
