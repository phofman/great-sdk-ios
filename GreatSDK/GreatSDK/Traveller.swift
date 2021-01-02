//
//  Traveller.swift
//  GreatSDK
//
//  Created by Pawel Hofman on 02/01/2021.
//

import Foundation

public struct Traveller {
  public let id: Int
  public let name: String?

  public init(id: Int, name: String? = nil) {
    self.id = id
    self.name = name
  }
}

extension Traveller {

  public static func printHello(person: Traveller? = nil) {
    print(getWelcome(person))
  }

  private static func getWelcome(_ person: Traveller? = nil) -> String {
    if let name = person?.name {
      return "Hello \(name), almighty traveller. Welcome in my castle!"
    }
    return "Hello traveller. Welcome here!"
  }
}
