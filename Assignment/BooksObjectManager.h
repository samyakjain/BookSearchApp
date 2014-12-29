//
//  BooksObjectManager.h
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface BooksObjectManager : NSObject
- (NSArray *)getBookObjectsArrayFromData:(NSDictionary *)data;
@end
