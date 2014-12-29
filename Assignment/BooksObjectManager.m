//
//  BooksObjectManager.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "BooksObjectManager.h"

@interface BooksObjectManager()
@property (nonatomic,strong) NSMutableArray *bookObjectsArray;
@end

@implementation BooksObjectManager

- (NSMutableArray *)bookObjectsArray{
    if(!_bookObjectsArray){
        _bookObjectsArray=[[NSMutableArray alloc] init];
    }
    return _bookObjectsArray;
}


- (NSArray *)getBookObjectsArrayFromData:(NSDictionary *)data{
    [self.bookObjectsArray removeAllObjects];
    for (NSDictionary *bookData in data) {
        Book *bookObj=[[Book alloc] initWithData:bookData];
        [self.bookObjectsArray addObject:bookObj];
    }
    return self.bookObjectsArray;
}

@end
