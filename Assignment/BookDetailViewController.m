//
//  BookDetailViewController.m
//  Assignment
//
//  Created by Samyak on 12/28/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "BookDetailViewController.h"
#import "UtilityHelper.h"

@interface BookDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *bookTitle;
@property (weak, nonatomic) IBOutlet UILabel *bookAuthors;
@property (weak, nonatomic) IBOutlet UILabel *bookPublisher;
@property (weak, nonatomic) IBOutlet UILabel *bookIsbn10;
@property (weak, nonatomic) IBOutlet UILabel *bookIsbn13;
@property (weak, nonatomic) IBOutlet UILabel *bookDimensions;
@property (weak, nonatomic) IBOutlet UILabel *bookEditorialInfo;
@property (weak, nonatomic) IBOutlet UIView *bookSubjectsUIView;
@property (weak, nonatomic) IBOutlet UILabel *bookSubjectLegendLabel;

@end

@implementation BookDetailViewController

- (Book *)bookDetailData{
    if (!_bookDetailData) {
        _bookDetailData=[[Book alloc] init];
    }
    return _bookDetailData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Book Details"];
//    self.navigationController.navigationBar.topItem.title=@"Book Details";
    [self setDataInLabels];
    
    // Do any additional setup after loading the view.
}

- (void)setDataInLabels {
    self.bookTitle.text=self.bookDetailData.title;

    NSString *authorString=@"";
    for (NSDictionary *author in self.bookDetailData.authors) {
        authorString=[authorString stringByAppendingString:[author objectForKey:@"name"]];
    }
    self.bookAuthors.text=authorString;
    
    self.bookPublisher.text=self.bookDetailData.publisherName;
    self.bookIsbn10.text=self.bookDetailData.isbn10;
    self.bookIsbn13.text=self.bookDetailData.isbn13;
    self.bookDimensions.text=self.bookDetailData.dimensions;
    self.bookEditorialInfo.text=self.bookDetailData.editorialInfo;
    
    [self createSubjectLables];

}

- (void)createSubjectLables {
    UIView *lastSubviewAdded=self.bookSubjectLegendLabel;
    if(![self.bookDetailData.subjects count]){
        [self.bookSubjectLegendLabel setHidden:YES];
    }
    NSLog(@"%d",(int)[self.bookDetailData.subjects count]);
    for (NSString *subject in self.bookDetailData.subjects) {
        UILabel *tempLabel=[[UILabel alloc] initWithFrame:lastSubviewAdded.frame];
        CGRect frame=tempLabel.frame;
        frame.origin.y=lastSubviewAdded.frame.origin.y+lastSubviewAdded.frame.size.height-5;
        frame.size.width=[[UIScreen mainScreen] bounds].size.width-50;
        [tempLabel setFrame:frame];
        [tempLabel setText:[UtilityHelper covertUnderscoreToSpaceAndCapitalise:subject]];
        [tempLabel setFont:[UIFont fontWithName:@"Avenir Next" size:12.0f]];
        tempLabel.lineBreakMode=NSLineBreakByWordWrapping;
        [tempLabel setNumberOfLines:1];
        [tempLabel setTextColor:[UIColor lightGrayColor]];
        [self.bookSubjectsUIView addSubview:tempLabel];
        lastSubviewAdded=tempLabel;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
