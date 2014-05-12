//
//  SimpleDatePicker.m
//  
//
//  Created by Cole Bratcher on 5/12/14.
//
//

#import "SimpleDatePicker.h"

@implementation SimpleDatePicker

- (NSMutableArray *)pickerDateArray {
    // Creates an array for the next 7 days out for the purpose of populating date picker [dateArray removeAllObjects];
    NSMutableArray *dateArray = [NSMutableArray new];
    
    for (int row = 0; row < 7; row++) {
        
        // Obtain the current time
        NSDate *sourceDate = [NSDate date];
        NSTimeZone *sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        
        // Determine local system timezone
        NSTimeZone *currentTimeZone = [NSTimeZone systemTimeZone];
        NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
        NSInteger currentGMTOffset = [currentTimeZone secondsFromGMTForDate:sourceDate];
        NSTimeInterval interval = currentGMTOffset - sourceGMTOffset;
        
        // Determine local time once offset is found
        NSDate *currentDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate];
        
        // Converts current time into integer values for assigning default to departure date
        NSCalendar *convertDateToInt = [NSCalendar currentCalendar];
        NSDateComponents *componentsConvert = [convertDateToInt components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate];
        NSDate *updatedDepartureDate;
        
        // Break the date down into pieces so you can perform operations against it
        NSDateComponents *componentsDeparture = [[NSDateComponents alloc] init];
        
        [componentsDeparture setDay:[componentsConvert day] + row]; // Increments the day by the index value
        [componentsDeparture setMonth:[componentsConvert month]]; [componentsDeparture setYear:[componentsConvert year]]; [componentsDeparture setMinute:0];
        [componentsDeparture setHour:18];
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; updatedDepartureDate = [gregorian dateFromComponents:componentsDeparture];
        
        // Take the updated departure date and format it
        NSString *str = [NSString stringWithFormat:@"%@",updatedDepartureDate]; NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss VVVV"];
        NSDate *date = [dateFormatter dateFromString: str];
        
        // Format for output for assignment to array
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; NSString *convertedString = [dateFormatter stringFromDate:date];
        
        [dateArray addObject:convertedString];
    }
    
    
    
    return dateArray;
}

@end
