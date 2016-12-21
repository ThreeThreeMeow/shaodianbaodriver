//
//  HttpTool.h
//  ShaoDianBaoDriver
//
//  Created by 光小星 on 2016/12/18.
//  Copyright © 2016年 Shanxi shaodianbao network technology co.,LTD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD+Extension.h"

@interface HttpTool : NSObject


/**
 *  get方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameters 请求的参数
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
+ (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(id)parameters
                      success:(void(^)(id responseObject))success
                      failure:(void(^)(NSError *error))failure;

/**
 *  POST方法请求
 *
 *  @param URLString 请求的URL地址
 *  @param parameters 请求的参数
 *  @param success   请求成功的回调代码块
 *  @param failure   请求失败
 */
+ (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
                       success:(void(^)(id responseObject))success
                       failure:(void(^)(NSError *error))failure;

/**
 *  多图上传
 *
 *  @param url            链接地址
 *  @param parameters     表单参数
 *  @param imageArray     图片数组UIImage
 *  @param imageArrayName 数组名称
 *  @param radio 压缩比例
 *  @param success        成功回调
 *  @param failure        失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)postMultipartImageWithURL:(NSString *)url
                                         parameters:(id)parameters
                                         imageArray:(NSArray *)imageArray
                                     imageArrayName:(NSString *)imageArrayName
                                 compressionQuality:(CGFloat)radio
                                            success:(void (^)(id responseObject))success
                                            failure:(void (^)(NSError *error))failure;

/**
 *  图片上传
 *
 *  @param URLString  URL链接
 *  @param parameters 地址参数
 *  @param data       图片为data数据流
 *  @param name       图片name
 *  @param fileName   图片文件名称
 *  @param success    成功回调
 *  @param failure    失败回调
 *
 *  @return NSURLSessionDataTask
 */
+ (NSURLSessionDataTask *)Upload:(NSString *)URLString
                      parameters:(id)parameters data:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;


@end
