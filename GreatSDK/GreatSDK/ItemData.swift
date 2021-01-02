//
//  DataParser.swift
//  GreatSDK
//
//  Created by Pawel Hofman on 02/01/2021.
//

import Foundation
import SwiftyXMLParser

public struct ItemData {
  public let id: Int
  public let name: String
  public let value: String?

  init(id: Int, name: String, value: String?) {
    self.id = id
    self.name = name
    self.value = value
  }

  func toString() -> String {
    return "\(id): \(name) = \(value ?? "--none--")"
  }
}

extension ItemData {

  public static func load(content: String?) -> [ItemData]? {

    guard let str = content, !str.isEmpty else { return nil }

    let xml = try! XML.parse(str)
    return xml.Items.Item.map {
      ItemData(id: Int($0.attributes["id"] ?? "0") ?? 0, name: $0.attributes["name"] ?? "", value: $0.attributes["value"] ?? "")
    }
  }
}
