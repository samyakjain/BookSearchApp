//
//  LoaderView.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "LoaderView.h"

@interface LoaderView()
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation LoaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"LoaderView" owner:self options:nil] objectAtIndex:0];
        CGRect viewFrame = self.frame;
        UIScreen *currentScreen = [UIScreen mainScreen];
        viewFrame.size=CGSizeMake(200, 120);
        viewFrame.origin = CGPointMake((currentScreen.bounds.size.width - viewFrame.size.width)/2, (currentScreen.bounds.size.height - viewFrame.size.height)/2-50);

        [self setFrame:viewFrame];
        // Initialization code
    }
    return self;
}

- (void)setMessage:(NSString *)message{
    self.messageLabel.text = message;
}

- (void)setMessage:(NSString *)message AndShow:(BOOL)show{
    [self setMessage:message];
    self.hidden = !show;
}

- (void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    self.parentViewController.view.userInteractionEnabled = hidden;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
