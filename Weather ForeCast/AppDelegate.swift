//
//  AppDelegate.swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 20/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        // Since we are not using a storyboard, initialising the MainViewController with it's collection view flow layout and empty weather data. We load the weather data from the API, which is just below.
        let mainViewController = MainViewController(collectionViewLayout: UICollectionViewFlowLayout(), weatherForecastResults: [])
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        
        // Downloading weather data from here, and later injecting to the VC. Depndency Injection!
        NetworkService.shared.downloadingWeatherData(for: .london) { downloadedForecastResults in
            mainViewController.weatherForecastResults = downloadedForecastResults
        }
        
        return true
    }
}

