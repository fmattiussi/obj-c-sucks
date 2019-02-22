//
//  comViewController.h
//  objcsuck
//
//  Created by Francesco Mattiussi on 19/02/19.
//  Copyright (c) 2019 Francesco Mattiussi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface comViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@property (weak, nonatomic) IBOutlet UITableView *tableview;




@end

