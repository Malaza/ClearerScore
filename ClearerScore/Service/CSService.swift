//
//  CSService.swift
//  ClearerScore
//
//  Created by Mthokozisi Malaza on 2023/08/09.
//

import UIKit

typealias GetCompletion = (Any?, CSServiceError?) -> Void

protocol CSServiceProtocol {
    func executeFetchList(completion: @escaping GetCompletion)
}


enum CSServiceMethod: String {
    case get = "GET"
    case post = "POST"
}


public enum CSServiceError: Error {
    case failed
}


class CSService: CSServiceProtocol {
    
    var completion: GetCompletion?
    
    func executeFetchList(completion: @escaping GetCompletion) {
        
        self.completion = completion
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = CSServiceMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.async() {
                if (error != nil) {
                    self.completion!(nil, .failed)
                }
                else {
                    self.completion!(data, nil)
                }
            }
        })
        dataTask.resume()
    }
}
