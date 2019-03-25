//
//  DetailViewControllerTests.swift
//  Weather ForeCastTests
//
//  Created by kaveh Darvishi on 20/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import XCTest
@testable import Weather_ForeCast

class DetailViewControllerTests: XCTestCase {

    let currentWeather = FiveDaysForeCast.init(dt: nil, date: nil, weather: nil, mainDetails: nil, wind: nil, rain: nil, cloud: nil)
    var sut: DetailViewController!
    
    override func setUp() {
        sut = DetailViewController(currentWeather)
    }

    override func tearDown() {
        sut = nil
    }

    func testMainLabelValue() {
        XCTAssertEqual("Main Weather: N.A", sut.getMainLabelText(for: currentWeather))
    }
    func testDescriptionLabelValue() {
        XCTAssertEqual("Description: N.A", sut.descriptionLabel.text)
    }
    func testTempratureLabelValue() {
        XCTAssertEqual(" average Temprature: N.A", sut.tempratureLabel.text)
    }
    func testHumidtyLabelValue() {
        XCTAssertEqual(" Humidity: N.A", sut.humidityLabel.text)
    }
    func testOressureLabelValue() {
        XCTAssertEqual(" Pressure: N.A", sut.pressureLabel.text)
    }
    func testminTempLabelValue() {
        XCTAssertEqual(" minumum Temp: N.A", sut.minimumTempratureLabel.text)
    }
    func testMaxTempLabelValue() {
        XCTAssertEqual(" maximum Temp: N.A", sut.maximumTempratureLabel.text)
    }
    func testkfTempLabelValue() {
        XCTAssertEqual(" kf Temp: N.A", sut.kfTempratureLabel.text)
    }
}
