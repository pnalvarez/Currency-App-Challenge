//
//  API.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation
import Combine

// MARK: - Interface for API Service
protocol APIProtocol {
  associatedtype T: Decodable
  func fetchData(_ endpoint: EndpointExposable) -> AnyPublisher<T, Error>
}

// MARK: - Custom erros
enum APIError: Error {
  case urlError
  case genericError(_ description: String)
}

// MARK: - Concrete type
final class API<T: Decodable>: APIProtocol {
  // MARK: Dependencies specification
  typealias Dependencies = HasDecoder
  
  // MARK: - Base path
  private let basePath = "http://localhost:3000"
  
  private let dependencies: Dependencies
  
  init(dependencies: Dependencies = DependencyContainer()) {
    self.dependencies = dependencies
  }
  
  func fetchData<T: Decodable>(_ endpoint: EndpointExposable) -> AnyPublisher<T, Error> {
    // Creates complete path
    let path = basePath + endpoint.path + "\(String(describing: makeExtraHeaders(from: endpoint) ?? ""))"
    // Checks if URL is valid
    guard let url = URL(string: path) else {
      return Fail(error: APIError.urlError).eraseToAnyPublisher()
    }
    // Creates URL request
    var request = URLRequest(url: url)
    request.httpMethod = endpoint.httpMethod.rawValue
    request.httpBody = endpoint.body
    // Return URL Session Publisher
    return URLSession.shared
      .dataTaskPublisher(for: request)
    // Maps API errors to Generic error
      .mapError({
        APIError.genericError($0.localizedDescription)
      })
    // Maps the data component from the publisher output
      .map(\.data)
    // Decodes the output to a Decodable type, which is generic to this class, using the JSONDecoder dependency
      .decode(type: T.self, decoder: dependencies.jsonDecoder)
    // Debugging Combine
      .handleEvents(receiveOutput: { print("Received output: \($0)")})
    // Publisher abstraction
      .eraseToAnyPublisher()
  }
}

// MARK: - Private methods
private extension API {
  func makeExtraHeaders(from endpoint: EndpointExposable) -> String? {
    // Query starting
    var headerString = "?"
    guard var headers = endpoint.headers,
          let first = headers.first else {
      return nil
    }
    // Takes first parameter
    headerString += "\(first.key)=\(first.value)"
    headers.removeValue(forKey: first.key)
    
    // Appending and separating other queries by &
    for (key, value) in headers {
      headerString += "&\(key)=\(value)"
    }
    return headerString
  }
}
