//
//  ViewController.h
//  CountString
//
//  Created by ankur on 29/08/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) IBOutlet UITextField *stringTextView;
- (IBAction)countStringChar:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btncountStringChar;
@end

