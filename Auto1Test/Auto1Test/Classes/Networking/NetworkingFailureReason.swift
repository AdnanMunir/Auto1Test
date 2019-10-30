//
//  NetworkingFailureReason.swift
//
//
//  Created by Adnan Munir on 17/12/2018.
//  Copyright © 2018 A. All rights reserved.
//

import Foundation
import Alamofire
enum NetworkFailureReason {
    case decodingTypeFailed
    case decodingFailed(error: Error)
    case invalidRequestConvertable
    case responseFailed(error: Error)
    case apiResponse(response:APIResponse)
    case sessionOut
    case internalServerError
    case other
    case reason(error:String)
}

extension NetworkFailureReason: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .decodingTypeFailed: return "Decoding Type issue"
        case .decodingFailed(let error): return error.localizedDescription
        case .invalidRequestConvertable: return "Request is not valid."
        case .responseFailed(let error):
            if error.localizedDescription.contains("Response could not be serialized") {
                return "Log Out".localize
            }
            return error.localizedDescription
        case .apiResponse(let response): return response.error ?? response.success?.error ?? ""
        case .sessionOut: return "Log Out".localize
        case .internalServerError: return "Interval Server error".localize
        case .reason(let error): return error.localize
        case .other: return "Something went wrong."
        }
    }
}
