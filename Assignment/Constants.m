//
//  Constants.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "Constants.h"

@implementation Constants
static NSString *const apiUrl =   @"http://isbndb.com/api/v2/json/";

+ (NSString *)getBookSearchUrl{
    return [NSString stringWithFormat:@"%@%@%@",apiUrl,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"apiKey"],@"/books"];
}

@end
