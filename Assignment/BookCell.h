//
//  BookCell.h
//  Assignment
//
//  Created by Samyak on 12/28/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthors;
@property (weak, nonatomic) IBOutlet UILabel *bookIsbn;




@end
