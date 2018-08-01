//
//  API.swift
//  AnyeProject
//
//  Created by 赵传保 on 2018/7/12.
//  Copyright © 2018年 赵传保. All rights reserved.
//

import Foundation
import Moya
enum API {
    case accountUserData
    case bookDetail(articleid:String)
    case easyRequset
}

extension API:TargetType{
    var baseURL: URL {
        return URL(string: "https://api.anyew.cn/")!
    }
    
    var path: String {
        switch self {
        case .accountUserData:
            return "my/getMyInfo"
        case .bookDetail:
            return "bookDetails/getBookDetails"
        default:
            return ""
        }
    }
    
    var method:  Moya.Method {
        switch self {
        case .accountUserData:
            return .get
        case .bookDetail:
            return .get
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        
        var parmeters = ["time":getNowTimeOfSystem(),"device_id":device_id,"device_type":"ios","version":version,"userid":"4742918"]
        
        printLog("参数: \(parmeters)")
        
        //1channelappstorechannel_sourceDFC2F47F-E550-4257-9D79-8DE1362D2503device_idiosdevice_type1533102152timelogintype4742918userid2.2.2versionhuiwenanyeactivity/getActivity
        printLog("接口地址: \(path)")
        
        switch self {
        case .accountUserData:
            let tokenStr = getRequestToken(parmeters as Any as! Dictionary<String, Any>, path)
            parmeters["token"] = tokenStr
            printLog("拼接token的参数: \(parmeters)")
            return .requestParameters(parameters: parmeters as Any as! [String : Any], encoding: URLEncoding.default)
        case let .bookDetail(articleid: articleid):
            return .requestParameters(parameters: ["articleid":articleid], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
        
        
        
    }
    var headers: [String : String]? {
        return nil
//        return ["Content-Type":"application/x-www-form-urlencoded"]
        //,"Content-Type":"application/json","Content-Type":"text/json","Content-Type":"text/javascript","Content-Type":"text/html","Content-Type":"text/xml","Content-Type":"text/plain"
    }
    
    
}

//获取token
func getRequestToken(_ parms:Dictionary<String, Any>, _ path:String) -> String {
    
    //排序
    let sortKeyArr = parms.keys.sorted { (s1, s2) -> Bool in
        return s1 < s2
    }
    
    printLog("\(sortKeyArr)")
    
    var tokenStr = ""
    for  key in sortKeyArr {
        
        let values = parms[key] as! String
        tokenStr.append(key+values)
    }
    tokenStr = tokenStr+secret+path
    printLog("tokenStr: \(tokenStr)")
    //MD5
    let endTokenStr = MD5Util.md5(tokenStr).lowercased()
    printLog("endTokenStr: \(endTokenStr)")
    return endTokenStr
}
