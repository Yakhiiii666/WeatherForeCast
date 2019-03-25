//
//  ViewController.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishion 20/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import UIKit

final class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let FORECAST_COLLECTIONVIEWCELL_REUSE_IDENTIFIER = "cellId"
    let LONDON_CITY_NAME = "London"
    let COLLECTIONVIEWCELL_HEIGHT: CGFloat = 100
    let COLLECTIONVIEW_LAYOUT_MINIMUM_LINE_SPACING: CGFloat = 1
    let COLLECTIONVIEW_LAYOUT_MINIMUM_INTERITEM_SPACING: CGFloat = 1
    
    var weatherForecastResults: [FiveDaysForeCast]! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    init(collectionViewLayout layout: UICollectionViewLayout, weatherForecastResults: [FiveDaysForeCast]) {
        super.init(collectionViewLayout: layout)
        ({ self.weatherForecastResults = weatherForecastResults })()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: FORECAST_COLLECTIONVIEWCELL_REUSE_IDENTIFIER)
    }
}

// CollectionView Delegate and DataSource methods
extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherForecastResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FORECAST_COLLECTIONVIEWCELL_REUSE_IDENTIFIER, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        cell.locationLabel.text = LONDON_CITY_NAME
        
        var temperatureString = "N.A"
        if let temp = weatherForecastResults[indexPath.item].mainDetails?.temprature {
            temperatureString = String(temp)
        }
        cell.tempratureLabel.text = temperatureString
        
        cell.weatheDescriptionLabel.text = weatherForecastResults[indexPath.item].weather?[0].description
        cell.weatherMainLabel.text = weatherForecastResults[indexPath.item].weather?[indexPath.section].main
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return COLLECTIONVIEW_LAYOUT_MINIMUM_INTERITEM_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return COLLECTIONVIEW_LAYOUT_MINIMUM_LINE_SPACING
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: COLLECTIONVIEWCELL_HEIGHT)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentWeather = weatherForecastResults[indexPath.item]
        // Dependency injection used here
        let nextVC = DetailViewController(currentWeather)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
