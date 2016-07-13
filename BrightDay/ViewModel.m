//
//  ViewModel.m
//  BrightDay
//
//  Created by David Beleza on 12/07/16.
//  Copyright © 2016 David Beleza. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel

enum dateType {Sunday=1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday};


- (void)getNextLotteryDateFromDate:(NSDate*)date afterCompletion:(void(^)(NSString*date))completion {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSDate *newDate = date;
        NSDateComponents *dateComponent = [[NSCalendar currentCalendar] components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour fromDate:newDate];
        
        if (dateComponent.weekday < Wednesday || (dateComponent.weekday == Wednesday && dateComponent.hour<20) || (dateComponent.weekday == Saturday && dateComponent.hour>19)) {
            //If weekday is before Wednesday
            
            while (dateComponent.weekday != Wednesday) {
                
                newDate = [newDate dateByAddingTimeInterval:60*60*24*1];
                dateComponent = [[NSCalendar currentCalendar] components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour fromDate:newDate];
                
            }
            
            
        }
        else {
                
            while (dateComponent.weekday != Saturday) {
                
                newDate = [newDate dateByAddingTimeInterval:60*60*24*1];
                dateComponent = [[NSCalendar currentCalendar] components: NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour fromDate:newDate];
                
                
            }

        }
        
        
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        
        [comps setYear:dateComponent.year];
        [comps setMonth:dateComponent.month];
        [comps setDay:dateComponent.day];
        [comps setHour:20];
        
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        [calendar setFirstWeekday:2]; //Set Monday 
        NSDate *finalDate = [calendar dateFromComponents:comps];
        
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
        [dateFormat setDateFormat:@"dd/MM/yyyy | hha"];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completion([dateFormat stringFromDate:finalDate]);
            
        });
        
    });
    
}

@end
