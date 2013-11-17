//
//  PillItem.h
//  iReminder
//
//  Created by Ruben Fernandez Fuste on 16/11/13.
//  Copyright (c) 2013 Rff Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PillItem : NSObject

@property NSString *pillName;
@property BOOL taken;
@property (readonly) NSDate *time;



@end
