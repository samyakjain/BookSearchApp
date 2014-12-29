//
//  BookSearchTableDelegate.h
//  Assignment
//
//  Created by Samyak on 12/28/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookCell.h"
#import "Book.h"

@protocol BookSearchTableActionDelegate <NSObject>
- (void)bookSelectedWithData:(Book *)data;
@end

@interface BookSearchTableDelegate : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSArray *bookObjectsArray;
@property (nonatomic,weak) id <BookSearchTableActionDelegate> bookSearchTableActionDelegate;
@end
