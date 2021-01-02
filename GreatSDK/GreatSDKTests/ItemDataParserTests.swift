//
//  ItemDataParserTests.swift
//  GreatSDKTests
//
//  Created by Pawel Hofman on 02/01/2021.
//

import Foundation
import XCTest
@testable import GreatSDK

class ItemDataParserTests : XCTestCase {


  func testParseEmptyReturnsNil() throws {
    let result = ItemData.load(content: "")

    XCTAssertNil(result)
  }

  func testParseSingleItemReturns1() throws {
    let content = """
<Items>
  <Item id="123" name="John" value="Appleseed" />
</Items>
"""

    let result = ItemData.load(content: content)

    XCTAssertNotNil(result)
    XCTAssertEqual(1, result?.count)
    XCTAssertEqual("John", result?[0].name)
  }
}
