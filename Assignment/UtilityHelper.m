//
//  UtilityHelper.m
//  Assignment
//
//  Created by Samyak on 12/28/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "UtilityHelper.h"

@implementation UtilityHelper
+(NSString *)covertUnderscoreToSpaceAndCapitalise:(NSString *)string{
    NSString *formattedString;
    formattedString=[string stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    return [formattedString capitalizedString];
}
@end
