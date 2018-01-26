//
//  NSDate+Compare.m
//  CiticMovie
//
//  Created by fuqiang on 1/12/14.
//  Copyright (c) 2014 fuqiang. All rights reserved.
//

#import "NSDate+Compare.h"

@implementation NSDate (Compare)

- (BOOL)isEqualDay:(NSDate*)date
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:self];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date];
    
    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}


@end
