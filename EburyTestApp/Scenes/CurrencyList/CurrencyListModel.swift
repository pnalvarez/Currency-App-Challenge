//
//  CurrencyListModel.swift
//  EburyTestApp
//
//  Created by Pedro Alvarez on 17/02/23.
//

struct CurrencyListModel: Decodable {
  let accountId: String
  let companyName: String
  let amount: AmountModel
  let indicator: String
  let dateTime: String
  
  private enum CodingKeys: String, CodingKey {
    case accountId = "account_id"
    case companyName = "company_name"
    case amount
    case indicator = "credit_debit_indicator"
    case dateTime = "datetime"
  }
}

struct AmountModel: Decodable {
  let amount: String
  let currency: String
}
