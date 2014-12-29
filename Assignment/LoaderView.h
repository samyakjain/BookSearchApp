//
//  LoaderView.h
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoaderView : UIView

- (void)setMessage:(NSString *)message;
- (void)setMessage:(NSString *)message AndShow:(BOOL)show;
@property (strong, nonatomic) UIViewController *parentViewController;

@end
