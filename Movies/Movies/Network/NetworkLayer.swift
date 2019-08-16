//
//  NetworkLayer.swift
//  Movies
//
//  Created by Ezequiel França on 13/08/19.
//  Copyright © 2019 Ezequiel França. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case genericError
    case urlError
    case dataError
    case encodeError(type: String)
}

public enum Result<T> {
    case success(T)
    case error(NetworkError)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        
        switch self {
        case .genericError:
            return NSLocalizedString(
                "Something went wrong. Please try again later",
                comment: ""
            )
        case .urlError:
            return NSLocalizedString(
                "Unable to create URL from given string",
                comment: ""
            )
        case .dataError:
            return NSLocalizedString(
                "Cannot encode given object into Data",
                comment: ""
            )
        case .encodeError(let type):
            return NSLocalizedString(
                "Unable to parse the response in given type \(type)",
                comment: ""
            )
            
        }
    }
}

typealias NetworkCompletionHandler = (Data?, URLResponse?, Error?) -> Void
public typealias ErrorHandler = (NetworkError) -> Void

open class NetworkLayer {
    
    public init() {}
    
    open func get<T: Decodable>(urlString: String,
                                headers: [String: String] = [:],
                                successHandler: @escaping (Result<T>) -> Void,
                                errorHandler: @escaping (Result<NetworkError>) -> Void) {
        
        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let error = error {
                print(error.localizedDescription)
                errorHandler(.error(NetworkError.genericError))
                return
            }
            
            if self.isSuccessCode(urlResponse) {
                guard let data = data else {
                    return errorHandler(.error(NetworkError.encodeError(type: "\(T.self)")))
                }
                
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                    JsonStringfy.prettyPrint(json!)
                    successHandler(.success(responseObject))
                    return
                }
            }
            errorHandler(.error(NetworkError.genericError))
        }
        
        guard let url = URL(string: urlString) else {
            return errorHandler(.error(NetworkError.urlError))
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
    }
    
    open func post<T: Encodable>(urlString: String,
                                 body: T,
                                 headers: [String: String] = [:],
                                 errorHandler: @escaping ErrorHandler) {
        
        let completionHandler: NetworkCompletionHandler = { (data, urlResponse, error) in
            if let _ = error {
                errorHandler(NetworkError.genericError)
                return
            }
            
            if !self.isSuccessCode(urlResponse) {
                errorHandler(NetworkError.genericError)
                return
            }
        }
        
        guard let url = URL(string: urlString) else {
            return errorHandler(NetworkError.urlError)
        }
        var request = URLRequest(url: url)
        request.timeoutInterval = 90
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.allHTTPHeaderFields?["Content-Type"] = "application/json"
        guard let data = try? JSONEncoder().encode(body) else {
            return errorHandler(NetworkError.dataError)
        }
        request.httpBody = data
        URLSession.shared
            .uploadTask(with: request,
                        from: data,
                        completionHandler: completionHandler)
            .resume()
    }
    
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
}
