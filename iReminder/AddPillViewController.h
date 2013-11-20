//
//  AddPillViewController.h
//  iReminder
//
//  Created by Ruben Fernandez Fuste on 16/11/13.
//  Copyright (c) 2013 Rff Systems. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PillItem.h"

/*  -- HIDE KEYBOARD --  
 *  Afegim el <UITextFieldDelegate> per a poder usar el patró
 *  Delegate amb els UITextFields. 
 *  NOTA: S'ha de posar sempre al ViewController on esta el control que volem usar.
 */
@interface AddPillViewController : UIViewController <UITextFieldDelegate>
@property PillItem *pill;
@property NSDate *time;
@end
