//
//  MyGraphGL.m
//  TestGraphGL
//
//  Created by jing on 5/15/17.
//  Copyright © 2017 jing. All rights reserved.
//

#import "MyGraphGL.h"

@implementation MyGraphGL

-(void)commandGetInfo {
    NSLog(@"commandGetInfo");
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/graphql"];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    urlRequest.HTTPMethod = @"POST";
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSString *scheme = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@",
                        @"query {",
                        @"  posts {",
                        @"    title",
                        @"  }",
                        @"}"];
    
//    scheme = @"query AllPosts {  posts {    ...PostDetails  }}fragment PostDetails on Post {  id  title  votes  author {    firstName    lastName  }}";
    

    

//    scheme = @"query {\
//                posts {\
//                    id,\
//                    title,\
//                    votes\
//                    author {\
//                        firstName,\
//                        lastName,\
//                        id\
//                    }\
//                }\
//                author(id: 2) {\
//                    firstName,\
//                    lastName,\
//                    id\
//                }\
//            }";
//
    
    
//    scheme = @"query {\
//    authors {\
//    firstName,\
//    lastName,\
//    id\
//    }\
//    }";
    
        scheme = @"mutation {\
        upvotePost(postId: 1) {\
        id,\
        title,\
        votes\
        }\
        }";
    
    NSDictionary *dic = @{@"query":scheme};

    NSLog(@"dic : %@", dic);
    
    urlRequest.HTTPBody = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    
    NSURLSessionDataTask *sessionTask = [[NSURLSession sharedSession]dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error:%@",error);
            return;
        }
        NSLog(@"data:%@",[NSString stringWithUTF8String:data.bytes]);
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSLog(@"json:%@", jsonDic);
    }];
 
    [sessionTask resume];
}

@end
