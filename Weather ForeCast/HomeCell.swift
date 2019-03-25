//
//  HomeCell.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 20/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import UIKit

final class CustomCell: UICollectionViewCell {
        let locationLabel: UILabel = {
        let NUMBER_OF_LINES = 0
        let label = UILabel()
        label.numberOfLines = NUMBER_OF_LINES
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .yellow
        label.backgroundColor = .yellow
        return label
    }()
        let tempratureLabel: UILabel = {
        let NUMBER_OF_LINES = 0
        let label = UILabel()
        label.numberOfLines = NUMBER_OF_LINES
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        return label
    }()
        let weatheDescriptionLabel: UILabel = {
        let NUMBER_OF_LINES = 0
        let label = UILabel()
        label.numberOfLines = NUMBER_OF_LINES
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .gray
        return label
    }()
        let weatherMainLabel: UILabel = {
        let NUMBER_OF_LINES = 0
        let label = UILabel()
        label.numberOfLines = NUMBER_OF_LINES
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        addSubview(locationLabel)
        addSubview(tempratureLabel)
        addSubview(weatherMainLabel)
        addSubview(weatheDescriptionLabel)
        setupWeatherDetailLabels()
    }
    
    private func setupWeatherDetailLabels() {
        let LOCATION_PADDINGTOP = CGFloat(8)
        let LOCATION_PADDINGLEFT = CGFloat(8)
        let LOCATION_PADDINGBOTTOM = CGFloat(0)
        let LOCATION_PADDINGRIGHT = CGFloat(0)
        let LOCATION_HEIGHT = CGFloat(40)
        let LOCATION_WIDTH = (frame.width - 20)/2
        let WEATHER_DESCRIPTION_PADDINGTOP = CGFloat(4)
        let WEATHER_DESCRIPTION_PADDINGLEFT = CGFloat(8)
        let WEATHER_DESCRIPTION_PADDINGBOTTOM = CGFloat(0)
        let WEATHER_DESCRIPTION_PADDINGRIGHT = CGFloat(4)
        let WEATHER_DESCRIPTION_HEIGHT = CGFloat(40)
        let WEATHER_DESCRIPTION_WIDTH = (frame.width - 20)/2
        let TEMPRATURE_PADDINGTOP = CGFloat(8)
        let TEMPRATURE_PADDINGLEFT = CGFloat(4)
        let TEMPRATURE_PADDINGBOTTOM = CGFloat(0)
        let TEMPRATURE_PADDINGRIGHT = CGFloat(8)
        let TEMPRATURE_HEIGHT = CGFloat(40)
        let TEMPRATURE_WIDTH = (frame.width - 20)/2
        let WEATHER_MAIN_PADDINGTOP = CGFloat(4)
        let WEATHER_MAIN_PADDINGLEFT = CGFloat(4)
        let WEATHER_MAIN_PADDINGBOTTOM = CGFloat(0)
        let WEATHER_MAIN_PADDINGRIGHT = CGFloat(8)
        let WEATHER_MAIN_HEIGHT = CGFloat(40)
        let WEATHER_MAIN_WIDTH = (frame.width - 20)/2
        
        locationLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil , right:nil, paddingTop: LOCATION_PADDINGTOP ,paddingLeft: LOCATION_PADDINGLEFT, paddingBottom: LOCATION_PADDINGBOTTOM, paddingRight: LOCATION_PADDINGRIGHT, width: LOCATION_WIDTH , height: LOCATION_HEIGHT)
        weatheDescriptionLabel.anchor(top: locationLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: WEATHER_DESCRIPTION_PADDINGTOP, paddingLeft: WEATHER_DESCRIPTION_PADDINGLEFT, paddingBottom: WEATHER_DESCRIPTION_PADDINGBOTTOM, paddingRight: WEATHER_DESCRIPTION_PADDINGRIGHT, width: WEATHER_DESCRIPTION_WIDTH , height: WEATHER_DESCRIPTION_HEIGHT)
        tempratureLabel.anchor(top: topAnchor, left: locationLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: TEMPRATURE_PADDINGTOP, paddingLeft: TEMPRATURE_PADDINGLEFT, paddingBottom: TEMPRATURE_PADDINGBOTTOM, paddingRight: TEMPRATURE_PADDINGRIGHT, width: TEMPRATURE_WIDTH , height: TEMPRATURE_HEIGHT)
        weatherMainLabel.anchor(top: tempratureLabel.bottomAnchor, left: weatherMainLabel.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: WEATHER_MAIN_PADDINGTOP, paddingLeft: WEATHER_MAIN_PADDINGLEFT, paddingBottom: WEATHER_MAIN_PADDINGBOTTOM, paddingRight: WEATHER_MAIN_PADDINGRIGHT, width: WEATHER_MAIN_WIDTH , height: WEATHER_MAIN_HEIGHT)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


