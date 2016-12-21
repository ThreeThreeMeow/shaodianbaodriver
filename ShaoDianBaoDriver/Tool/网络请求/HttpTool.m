//
//  HttpTool.m
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/18.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import "HttpTool.h"
#import "AFAppDotNetAPIClient.h"

@implementation HttpTool

+ (NSURLSessionDataTask *)postMultipartImageWithURL:(NSString *)url
                                         parameters:(id)parameters
                                         imageArray:(NSArray *)imageArray
                                     imageArrayName:(NSString *)imageArrayName
                                 compressionQuality:(CGFloat)radio
                                            success:(void (^)(id responseObject))success
                                            failure:(void (^)(NSError *error))failure {
    for (int i = 0; i < imageArray.count;i++) {
        if (![imageArray[i] isKindOfClass:[UIImage class]]) {
            //            [MBProgressHUD showError:@"请检查是否都是图片"];
            return nil;
        }
    }
    return [[AFAppDotNetAPIClient sharedClient] POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        int index = 0;
        for (UIImage *image in imageArray) {
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"yyyy-MM-dd";
            NSString *dateStr = [formatter stringFromDate:date];
            NSString *fileName = [NSString stringWithFormat:@"%@%d.png",dateStr,index];
            NSData *imageData = radio == 1.0f ? UIImageJPEGRepresentation(image, 1.0f) :UIImageJPEGRepresentation(image, radio);;
            [formData appendPartWithFileData:imageData name:imageArrayName fileName:fileName mimeType:@"image/png/jpg"];
            index ++;
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"status"] isEqual:[NSNull null]]) {
            //            [MBProgressHUD showError:@"服务器错误"];
            return;
        }
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (NSURLSessionDataTask *)Upload:(NSString *)URLString
                      parameters:(id)parameters
                            data:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure {
    
    return [[AFAppDotNetAPIClient sharedClient] POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/png/jpg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"status"] isEqual:[NSNull null]]) {
            //            [MBProgressHUD showError:@"服务器错误"];
            return;
        }
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


/** GET方法请求 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure {
    
    return [[AFAppDotNetAPIClient sharedClient] GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"code"] isEqual:[NSNull null]]) {
            //           [MBProgressHUD showError:@"服务器错误"];
            return;
        }
        if ([responseObject[@"code"] integerValue] == 0) {
            success(responseObject);
            [MBProgressHUD showSuccess:@"msg"];
        }else {
            [MBProgressHUD showError:@"服务器错误"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

/** POST方法请求 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure {
    //    NSDictionary *param = [ODRHeadInfo parameters:parameters];
    return [[AFAppDotNetAPIClient sharedClient] POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([[responseObject objectForKey:@"code"] isEqual:[NSNull null]]) {
            [MBProgressHUD showError:@"服务器错误"];
            return;
        }
        if ([[responseObject objectForKey:@"code"] integerValue] == 402) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"toLogin" object:nil];
            return;
        }
        if ([responseObject[@"code"] integerValue] == 0) {
            success(responseObject);
            [MBProgressHUD showSuccess:@"msg"];
        }else {
            [MBProgressHUD showError:@"服务器错误"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}


@end
