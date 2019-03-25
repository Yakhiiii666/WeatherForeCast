//
//  DetailViewController .swift
//  Weather ForeCast
//
//  Created by kaveh Darvishi on 21/03/2019.
//  Copyright © 2019 kaveh Darvishi. All rights reserved.
//

import UIKit

final class DetailViewController : UIViewController {
    
    // We would want it to be a let property, but to use the didSet observer we have to do the trade-off
    var currentWeather: FiveDaysForeCast! {
        didSet {
            _ = view
            mainLabel.text = self.getMainLabelText(for: currentWeather)
            descriptionLabel.text = self.getDiscriptionText(for: currentWeather)
            tempratureLabel.text = self.getTempratureText(for: currentWeather)
            humidityLabel.text = self.getHumidityText(for: currentWeather)
            pressureLabel.text = self.getPressureText(for: currentWeather)
            maximumTempratureLabel.text = self.getmaxTempratureText(for: currentWeather)
            minimumTempratureLabel.text = self.getminTempratureText(for: currentWeather)
            kfTempratureLabel.text =  self.getktlTempratureText(for: currentWeather)
        }
    }
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.backgroundColor = .white
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    let tempratureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        
        return label
    }()
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    let minimumTempratureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    let maximumTempratureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    let kfTempratureLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    init(_ currentWeather: FiveDaysForeCast) {
        super.init(nibName: nil, bundle: nil)
        ({ self.currentWeather = currentWeather })()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func loadView() {
        super.loadView()
        let stackView = UIStackView(arrangedSubviews: [
            mainLabel,
            descriptionLabel,
            tempratureLabel,
            humidityLabel,
            pressureLabel,
            minimumTempratureLabel,
            maximumTempratureLabel,
            kfTempratureLabel
            ])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        let SPACING_STACKVIEW = CGFloat(10)
        stackView.spacing = SPACING_STACKVIEW
        
        view.addSubview(stackView)
        edgesForExtendedLayout = []
   
        let PADDINGTOP_STACKVIEW = CGFloat(10)
        let PADDINGLEFT_STACKVIEW = CGFloat(40)
        let PADDINGBOTTOM_STACKVIEW = CGFloat(10)
        let PADDINGRIGHT_STACKVIEW = CGFloat(40)
        let WIDTH_STACKVIEW = CGFloat(0)
        stackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: PADDINGTOP_STACKVIEW, paddingLeft: PADDINGLEFT_STACKVIEW, paddingBottom: PADDINGBOTTOM_STACKVIEW, paddingRight: PADDINGRIGHT_STACKVIEW, width: WIDTH_STACKVIEW, height: view.frame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        print(self.mainLabel)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(self.mainLabel)
        print(self.mainLabel)
    }
    
    private func convertToString(from doubleValue: Double?) -> String {
        if let double = doubleValue { return String(double) }
        return "N.A"
    }
}

// Methods for displaying user readable values in the labels
extension DetailViewController {
    
    func getMainLabelText(for currentWeather: FiveDaysForeCast) -> String {
        return "Main Weather: \(currentWeather.weather?[0].main ?? "N.A")"
    }
    func getDiscriptionText(for currentWeather : FiveDaysForeCast) -> String{
        return "Description: \(currentWeather.weather?[0].description ?? "N.A")"
    }
    func getTempratureText(for currentWeather : FiveDaysForeCast) -> String{
        var tempratureString : String?
        tempratureString = convertToString(from: currentWeather.mainDetails?.temprature)
        return " average Temprature: \(tempratureString ?? "N.A")"
    }
    func getHumidityText(for currentWeather : FiveDaysForeCast) -> String{
        var humidityString: String?
        humidityString = convertToString(from: currentWeather.mainDetails?.humidity)
        return " Humidity: \(humidityString ?? "N.A")"
    }
    func getPressureText(for currentWeather : FiveDaysForeCast) -> String{
        var pressureString : String?
        pressureString = convertToString(from: currentWeather.mainDetails?.temprature)
        return " Pressure: \(pressureString ?? "N.A")"
    }
    func getminTempratureText(for currentWeather : FiveDaysForeCast) -> String{
    var minTempratureString : String?
    minTempratureString = convertToString(from: currentWeather.mainDetails?.minimumTemprature)
        return " minumum Temp: \( minTempratureString ?? "N.A" )"
    }
    func getmaxTempratureText(for currentWeather : FiveDaysForeCast) -> String{
        var maxTempString : String?
        maxTempString = convertToString(from: currentWeather.mainDetails?.maximumTemprature)
        return " maximum Temp: \(maxTempString ?? "N.A")"
    }
    func getktlTempratureText(for currentWeather : FiveDaysForeCast) -> String{
        var kfTempString : String?
        kfTempString = convertToString(from: currentWeather.mainDetails?.kfTemprature)
        return " kf Temp: \(kfTempString ?? "N.A")"
    }
}
