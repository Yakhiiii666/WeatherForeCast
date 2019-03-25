//
//  NetworkServiceTests.swift
//  Weather ForeCastTests
//
//  Created by kaveh Darvishion 24/03/19.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import XCTest
import Mockingjay
@testable import Weather_ForeCast

class NetworkServiceTests: XCTestCase {

    var sut: NetworkService!
    
    override func setUp() {
        sut = NetworkService.shared
    }

    override func tearDown() {
        sut = nil
    }

    func testDownloadWeatherData() {
        let path = Bundle(for: type(of: self)).path(forResource: "forecast", ofType: "json")!
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            let stubURI = uri("https://api.openweathermap.org/data/2.5/forecast?q=London&mode=json&APPID=4bc5e9fbb6356c11608652020cd39f98")
            stub(stubURI, jsonData(data))
            
            let promise = expectation(description: "Waiting for API response")
            sut.downloadingWeatherData(for: .london) { (downloadedWeathers) in
                print("API response received")
                XCTAssertEqual(downloadedWeathers.first?.mainDetails?.temprature, 115.57)
                promise.fulfill()
            }
            waitForExpectations(timeout: 5) { (error) in
                if let error = error { assertionFailure(error.localizedDescription) }
            }
        } else {
            assertionFailure("Failed to read json file")
        }
    }
}
