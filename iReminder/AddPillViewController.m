//
//  AddPillViewController.m
//  iReminder
//
//  Created by Ruben Fernandez Fuste on 16/11/13.
//  Copyright (c) 2013 Rff Systems. All rights reserved.
//

#import "AddPillViewController.h"
//#import "PillItem.h"

@interface AddPillViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
    
@end

@implementation AddPillViewController

/*  -- HIDE KEYBOARD --  
 * Implementem la funcio textFieldShouldReturn i preguntem si 
 * el objecte que rebem es e l mateix busquem i fem un
 * resign del first responder que es el teclat 
 */
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.textField)
    {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.doneButton) return;
    if (self.textField.text.length > 0)
    {
        self.pill = [[PillItem alloc] init];
        self.pill.pillName = self.textField.text;
        self.pill.time = self.timePicker.date;
        self.pill.taken = NO;
    }
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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
/*  -- HIDE KEYBOARD --  
 *  Afegim el patró delegate al ViewController 
 */
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
