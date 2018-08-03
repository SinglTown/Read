//
//  NetworkManager.swift
//  AnyeProject
//
//  Created by 赵传保 on 2018/7/12.
//  Copyright © 2018年 赵传保. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import RxSwift
import SwiftyJSON

//超时时长
private var requestTimeOut:Double = 30
//成功数据的回调
typealias successCallBack = ((_ successInfo:JSON) -> (Void))
//失败的回调
typealias failedCallback = ((_ failedInfo:JSON) -> (Void))
///网络错误的回调
typealias errorCallback = (() -> (Void))


private let myEndpointClosure = { (target: API) -> Endpoint in
    
    let url = target.baseURL.absoluteString + target.path
    var task = target.task
    
    //添加token相关的东西
    //计算token
    printLog(url)
    printLog(task)
    
    
    var endpoint = Endpoint(
        url: url,
        sampleResponseClosure: {.networkResponse(200, target.sampleData)},
        method: target.method,
        task: task,
        httpHeaderFields: target.headers
    )
    requestTimeOut = 30
    
    switch target {
    case .accountUserData:
        return endpoint
    default:
        return endpoint
    }
    
}

private let requestClosure = {(endpoint: Endpoint,done: MoyaProvider.RequestResultClosure) in
    do{
        var request = try endpoint.urlRequest()
        request.timeoutInterval = requestTimeOut
        if let requestData = request.httpBody{
            print("\(request.url!)"+"\n"+"\(request.httpMethod ?? "")"+"发送参数"+"\(String(data: request.httpBody!, encoding: String.Encoding.utf8) ?? "")")
        }else{
            print("\(request.url!)"+"\(String(describing: request.httpMethod))")
        }
        
        done(.success(request))
    }catch{
        done(.failure(MoyaError.underlying(error, nil)))
    }
}

private let networkPlugin = NetworkActivityPlugin.init { (changeType, targetType) in
    printLog("networkPlugin \(changeType)")
    
    switch(changeType){
    case .began:
        printLog("开始网络请求")
    case .ended:
        printLog("结束")
    }
}



let Provider = MoyaProvider(endpointClosure: myEndpointClosure, requestClosure: requestClosure, plugins: [networkPlugin], trackInflights: false)


func NetWorkRequest(target: API, completion: @escaping successCallBack, failed: failedCallback?,errorResult:errorCallback?) {
    if !isNetworkConnect {
        return
    }
    
    Provider.request(target) { (result) in
        
        switch result{
        case  let .success(response):
            do{
                let jsonData = JSON(data: response.data)
                if jsonData["code"] == 200 {
                    completion(jsonData)
                }else{
                    if failed != nil {
                        failed!(jsonData)
                    }
                }
            }catch{
                
            }
        case let .failure(error):
            if errorResult != nil{
                errorResult!()
            }
            print(error)
            break;
        }
        
    }
}

var isNetworkConnect : Bool{
    get{
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true
    }
}




