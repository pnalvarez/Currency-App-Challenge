//
//  CurrencyListModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

struct CurrencyListModel: Decodable {
  let accountId: String
  let companyName: String
  let amount: [AmountModel]
  let dateTime: String
  
  private enum CodingKeys: String, CodingKey {
    case accountId = "account_id"
    case companyName = "company_name"
    case amount
    case dateTime = "datetime"
  }
}

struct AmountModel: Decodable {
  let amount: String
  let currency: String
  let indicator: String
  
  private enum CodingKeys: String, CodingKey {
    case amount
    case currency
    case indicator = "credit_debit_indicator"
  }

}
