//
//  comViewController.m
//  objcsuck
//
//  Created by Francesco Mattiussi on 19/02/19.
//  Copyright (c) 2019 Francesco Mattiussi. All rights reserved.
//

#import "comViewController.h"

@interface comViewController () <UITextFieldDelegate>

@end



@implementation comViewController {
    NSArray *datitavola;
    NSMutableArray *elementi;
    NSMutableArray *date;
}


@synthesize textfield, tableview;



// pragma mark is used for easy access of code in Xcode
#pragma mark - TextField Delegates

// This method is called once we click inside the textField
-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"Text field did begin editing");
}

// This method is called once we complete editing
-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"Text field ended editing");
}

// This method enables or disables the processing of return key
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

NSString *testo = @"";

- (IBAction)incolla:(UIBarButtonItem *)sender {
    
    [elementi addObject:[UIPasteboard generalPasteboard].string];
    [date addObject:@"Incollato"];
    tableview.reloadData;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    textfield.placeholder = @"Scrivi cosa voi aggiungere";
    
    elementi = [NSMutableArray arrayWithObjects: nil];
    date = [NSMutableArray arrayWithObjects: nil];

	// Do any additional setup after loading the view, typically from a nib.

    
}


- (IBAction)aggiungielemento:(UIButton *)sender {
    NSString *stringavota = @"";
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);

    if ([textfield.text isEqualToString:@""]) {
        NSLog(@"non va bene");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oh no" message:@"Devi per forza scrivere qualcosa, qualsiasi" delegate:self cancelButtonTitle:@"Indietro" otherButtonTitles:@"Esempio",nil];
        [alert show];
        
    } else {
        NSLog(@"Il testo è", textfield.text);
        [elementi addObject:textfield.text];
        [date addObject:[dateFormatter stringFromDate:[NSDate date]]];
        textfield.text = @"";
        tableview.reloadData;
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        NSLog(@"OK Tapped. Hello World!");
        textfield.text = @"Sto usando una app bellissima!";
    }
}


- (IBAction)aprisito:(UIBarButtonItem *)sender {
    NSURL *url = [NSURL URLWithString:@"http://www.francescomattiussi.ml"];
    
    if (![[UIApplication sharedApplication] openURL:url]) {
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [elementi count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cella1";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [elementi objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [date objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [UIPasteboard generalPasteboard].string = [elementi objectAtIndex:indexPath.row];
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Copiato!" message:[elementi objectAtIndex:indexPath.row] delegate:nil cancelButtonTitle:@"Bene" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
