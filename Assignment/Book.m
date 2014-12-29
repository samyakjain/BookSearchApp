//
//  Book.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "Book.h"

@interface Book()
@property (nonatomic,strong) NSDictionary *bookData;

@end

@implementation Book

- (id)initWithData:(NSDictionary *)data{
    if(self=[super init]){
        self.bookData=data;
        self.title=[data objectForKey:@"title"];
        self.authors=[data objectForKey:@"author_data"];
        self.isbn13=[data objectForKey:@"isbn13"];
        self.isbn10=[data objectForKey:@"isbn10"];
        self.dimensions=[data objectForKey:@"physical_description_text"];
        self.publisherName=[data objectForKey:@"publisher_name"];
        self.editorialInfo=[data objectForKey:@"edition_info"];
        self.subjects=[data objectForKey:@"subject_ids"]; 
    }
    return self;
}

@end
