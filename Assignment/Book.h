//
//  Book.h
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

- (id)initWithData:(NSDictionary *)data;

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString  *isbn13;
@property (nonatomic,copy) NSString  *isbn10;
@property (nonatomic,copy) NSString *dimensions;
@property (nonatomic,copy) NSString *publisherName;
@property (nonatomic,copy) NSString *editorialInfo;

@property (nonatomic,strong) NSArray  *authors;
@property (nonatomic,strong) NSArray  *subjects;


@end
