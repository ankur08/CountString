//
//  ViewController.m
//  CountString
//
//  Created by ankur on 29/08/16.
//  Copyright © 2016 ankur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *characters ;
    NSMutableArray *charactersCount;
}@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    characters = [[NSMutableArray alloc] initWithCapacity:[_stringTextView.text length]];
    charactersCount = [[NSMutableArray alloc] initWithCapacity:[_stringTextView.text length]];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell*mycell=[_myTableView dequeueReusableCellWithIdentifier:@"Cell"];
    mycell.textLabel.text=[NSString stringWithFormat:@" %@ -> %@",[characters objectAtIndex:indexPath.row],[charactersCount objectAtIndex:indexPath.row]];
    NSLog(@"celldata=%@",[NSString stringWithFormat:@"%@ -> %@",[characters objectAtIndex:indexPath.row],[charactersCount objectAtIndex:indexPath.row]]);
    return mycell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return charactersCount.count;
}


- (IBAction)countStringChar:(id)sender {
    [characters removeAllObjects];
    [charactersCount removeAllObjects];
    
    NSString*myString=_stringTextView.text;
    if (myString.length>0) {
        
        for (int i=0; i < [myString length]; i++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [myString characterAtIndex:i]];
            //  char a=[myString characterAtIndex:i];
            if (characters.count==0) {
                [characters addObject:ichar];
                [charactersCount addObject:[NSString stringWithFormat:@"%d",[self countOccurenceOfAcharacter:myString character:[myString characterAtIndex:i]]]];
            }
            else{
                
                int occurence=[self countOccurenceOfAcharacter:[NSString stringWithFormat:@"%@",characters] character:[myString characterAtIndex:i]];
                if (occurence==0) {
                    [characters addObject:ichar];
                    [charactersCount addObject:[NSString stringWithFormat:@"%d",[self countOccurenceOfAcharacter:myString character:[myString characterAtIndex:i]]]];
                }
            }
        }
        NSLog(@"Char array and count=%@ ->%@",characters,charactersCount);
    }
    [_myTableView reloadData];
}

-(int)countOccurenceOfAcharacter:(NSString*)array character:(char)charactr{
    int occurrences = 0;
    for (int i=0; i<array.length; i++) {
        occurrences += ([array characterAtIndex:i]==charactr?1:0);
    }
    NSLog(@"number of occurences %d", occurrences);
    return occurrences;
}



@end
