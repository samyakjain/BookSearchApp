//
//  BookSearchTableDelegate.m
//  Assignment
//
//  Created by Samyak on 12/28/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "BookSearchTableDelegate.h"


@implementation BookSearchTableDelegate

- (NSArray *)bookObjectsArray{
    if(!_bookObjectsArray){
        _bookObjectsArray=[[NSArray alloc] init];
    }
    return _bookObjectsArray;
}

- (NSInteger)numberOfSections{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  90.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.bookObjectsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *simpleTableIdentifier = @"BookCell";
    BookCell *cell = (BookCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:simpleTableIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    Book *bookObj=[self.bookObjectsArray objectAtIndex:indexPath.row];
    cell.bookTitle.text=bookObj.title;
    cell.bookIsbn.text=bookObj.isbn13;
    NSString *authorString=@"";
    for (NSDictionary *author in bookObj.authors) {
        authorString=[authorString stringByAppendingString:[author objectForKey:@"name"]];
    }
    cell.bookAuthors.text=authorString;
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.bookSearchTableActionDelegate bookSelectedWithData:[self.bookObjectsArray objectAtIndex:indexPath.row]];
    
}
@end
