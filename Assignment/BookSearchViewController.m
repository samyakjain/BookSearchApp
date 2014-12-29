//
//  BookSearchViewController.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "BookSearchViewController.h"
#import "BooksObjectManager.h"
#import "BookDetailViewController.h"
#import "Constants.h"


@interface BookSearchViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *bookResultsTableView;
@property (nonatomic,strong) HTTPClient *httpClientObject;
@property (nonatomic, strong) BooksObjectManager *bookObjectManager;
@property (nonatomic,strong) BookSearchTableDelegate *bookSearchTableDelegate;

@end

@implementation BookSearchViewController

- (HTTPClient *)httpClientObject {
    if(!_httpClientObject){
        _httpClientObject=[[HTTPClient alloc] init];
        _httpClientObject.httpClientDelegateObject=self;
    }
    return _httpClientObject;
}

- (BooksObjectManager *)bookObjectManager{
    if(!_bookObjectManager) {
        _bookObjectManager=[[BooksObjectManager alloc] init];
    }
    return _bookObjectManager;
}

- (BookSearchTableDelegate *)bookSearchTableDelegate{
    if(!_bookSearchTableDelegate) {
        _bookSearchTableDelegate=[[BookSearchTableDelegate alloc] init];
        _bookSearchTableDelegate.bookSearchTableActionDelegate=self;
    }
    return _bookSearchTableDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.delegate=self;
    self.bookResultsTableView.delegate=self.bookSearchTableDelegate;
    self.bookResultsTableView.dataSource=self.bookSearchTableDelegate;
    if ([self.bookResultsTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.bookResultsTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.bookResultsTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.bookResultsTableView setLayoutMargins:UIEdgeInsetsZero];
    }
    [self.bookResultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *query=searchBar.text;
    NSDictionary *params=@{@"q":query};
    [searchBar resignFirstResponder];
    [self.loaderView setMessage:[NSString stringWithFormat:@"Searching books for \"%@\"",query] AndShow:YES];
    [self.httpClientObject getDataFromUrl:[Constants getBookSearchUrl] ForParams:params];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (void)httpClientDidFinishWithResponse:(NSDictionary *)response {
    [self.loaderView setHidden:YES];
    if(![[response objectForKey:@"data"] count]){
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Book Search" message:@"Sorry, we didn't find any book for the search query." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        [self.bookResultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        return;
    }
    [self.bookResultsTableView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
    [self.bookResultsTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    self.bookSearchTableDelegate.bookObjectsArray=[self.bookObjectManager getBookObjectsArrayFromData:[response objectForKey:@"data"]];
    [self.bookResultsTableView reloadData];
}

- (void)httpClientDidFinishWithError:(NSError *)error {
    [self.loaderView setHidden:YES];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Err..." message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)bookSelectedWithData:(Book *)data {
    [self performSegueWithIdentifier:@"bookListToBookDetails" sender:data];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"bookListToBookDetails"]){
        BookDetailViewController *bdvc=[segue destinationViewController];
        bdvc.bookDetailData=sender;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
