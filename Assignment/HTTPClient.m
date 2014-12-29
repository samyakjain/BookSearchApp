//
//  HTTPClient.m
//  Assignment
//
//  Created by Samyak on 12/27/14.
//  Copyright (c) 2014 whatnowtravel. All rights reserved.
//

#import "HTTPClient.h"
#import <AFNetworking/AFNetworking.h>

@interface HTTPClient()
@end

@implementation HTTPClient

- (void)getDataFromUrl:(NSString *)url ForParams:(NSDictionary *)params{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error;
        NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        [self.httpClientDelegateObject httpClientDidFinishWithResponse:parseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.httpClientDelegateObject httpClientDidFinishWithError:error];
    }];
}

@end
