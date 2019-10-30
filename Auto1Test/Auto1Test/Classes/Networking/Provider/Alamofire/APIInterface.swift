//
//  OLAPIInterface.swift
//
//
//  Created by Adnan Munir on 7/19/17.
//

import Alamofire


enum Result<T> {
    case success(T?)
    case failure(NetworkFailureReason)
}

class OLAPIInterface: NSObject {
    
   static private let manager = SessionManager.default
    
    static let sharedInstance = OLAPIInterface()
    
    private override init() { }
    
    func request<T:Decodable>(_ request: RequestConvertible,decodingType:T.Type?,completion:@escaping (Result<T>) -> Void) {
        
        guard let requestConvertible = request as? URLRequestConvertible else {
            completion(Result.failure(.invalidRequestConvertable))
            return
        }

        OLAPIInterface.manager.request(requestConvertible).validate().responseJSON { [unowned self] (response) in
            
            self.translateObject(request, decodingType: decodingType, response: response, completion: completion)

        }
    }
    
    private func translateObject<T:Decodable>(_ request: RequestConvertible,decodingType:T.Type?,response: DataResponse<Any>,completion:@escaping (Result<T>) -> Void) {
        
        print(response)
        print(response.response?.statusCode ?? 0)
        
        switch response.result {
        case .success(_):
            do {
                guard let _ = decodingType else {return completion(Result.success(nil)) }
                
                guard let decodingType = decodingType,let data = response.data  else { return completion(Result.failure(.decodingTypeFailed)) }
                if data == Data() { // To Check if data is of zero Bytes
                    completion(.success(nil))
                    return
                }
                let decodeableObj = try JSONDecoder().decode(decodingType, from: data)
                completion(.success(decodeableObj))
            } catch let error {
                completion(Result.failure(NetworkFailureReason.decodingFailed(error: error)))
            }
            break
        case .failure(let error):
            completion(Result.failure(NetworkFailureReason.responseFailed(error: error)))
            break
        }
    }
}

