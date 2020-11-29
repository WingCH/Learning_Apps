/// Copyright (c) 2018 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
import Swinject

@testable import Bitcoin_Adventurer

class BasicTests: XCTestCase {
  
  private let container = Container()
  
  // MARK: - Boilerplate methods
  
  override func setUp() {
    super.setUp()
    // register the Currency type to always return USD
    container.register(Currency.self){ _ in .USD}
    // You register the CryptoCurrency type to always return BTC
    container.register(CryptoCurrency.self) { _  in .BTC }

    // Register the Price type which in itself has two dependencies. To create these dependencies, ask the provided resolver to create them by using resolve(_:).
    container.register(Price.self) { resolver in
      let crypto = resolver.resolve(CryptoCurrency.self)!
      let currency = resolver.resolve(Currency.self)!
      return Price(base: crypto, amount: "999456", currency: currency)
    }

    // register the PriceResponse type and resolve a Price dependency needed to create it.
    container.register(PriceResponse.self) { resolver in
      let price = resolver.resolve(Price.self)!
      return PriceResponse(data: price, warnings: nil)
    }

  }
  
  override func tearDown() {
    super.tearDown()
    container.removeAll()
  }
  
  // MARK: - Tests
  
  func testPriceResponseData() {
    let response = container.resolve(PriceResponse.self)!
    XCTAssertEqual(response.data.amount, "999456")
  }
  
}
