//
//  WalletEndpoint.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 18/02/23.
//

import Foundation

enum WalletEndpoint: EndpointExposable {
  // List each possible endpoint here and compute other components according to it and its associated values
  case walletCheck
  
  //Endpoint
  var path: String {
    switch self {
    case .walletCheck:
      return "/wallets"
    }
  }
  
  var httpMethod: HTTPMethod {
    .GET
  }
  
  //Header
  var headers: [String : String]? {
    nil
  }
  
  //Body
  var body: Data? {
    nil
  }
}
