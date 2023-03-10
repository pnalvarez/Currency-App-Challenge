//
//  EndpointExposable.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

// MARK: - EndpointExposable
// Protocol representing an object for an endpoint
protocol EndpointExposable {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: [String : String]? { get }
    var body: Data? { get }
}
