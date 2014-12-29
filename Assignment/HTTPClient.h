//
//  HTTPClient.h
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HTTPClientDelegate <NSObject>
- (void)httpClientDidFinishWithResponse:(NSDictionary *)response;
- (void)httpClientDidFinishWithError:(NSError *)error;
@end

@interface HTTPClient : NSObject
@property (nonatomic,weak) id <HTTPClientDelegate> httpClientDelegateObject;

- (void)getDataFromUrl:(NSString *)url ForParams:(NSDictionary *)params;
@end
