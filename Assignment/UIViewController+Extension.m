//
//  UIViewController+Extension.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "UIViewController+Extension.h"
#import <objc/runtime.h>


@implementation UIViewController (Extension)
@dynamic loaderView;

- (LoaderView *)loaderView{
    LoaderView *lv = (LoaderView *) objc_getAssociatedObject(self, @selector(loaderView));
    if(!lv){
        lv = [[LoaderView alloc] init];
        lv.hidden = YES;
        lv.parentViewController = self;
        [self.view addSubview:lv];
        objc_setAssociatedObject(self, @selector(loaderView), lv, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return lv;
}

@end
