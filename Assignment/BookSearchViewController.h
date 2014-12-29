//
//  BookSearchViewController.h
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookSearchTableDelegate.h"

@interface BookSearchViewController : UIViewController<UISearchBarDelegate,HTTPClientDelegate,BookSearchTableActionDelegate>
@end
