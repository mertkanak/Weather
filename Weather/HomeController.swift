//
//  ViewController.swift
//  Weather
//
//  Created by mert Kanak on 11.12.2022.
//

import UIKit

class HomeController: UIViewController {


    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var feelslikeLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
            }
        }
    }
    
    private func setupUI() {
        setupHeader()
        setupSubHeader()
        
    }
    
    private func setupHeader() {
        temperatureLabel.text = viewModel.temperatureString
        nameLabel.text = viewModel.nameString
    }
    
    private func setupSubHeader() {
        feelslikeLabel.text = viewModel.feelsLikeTemperatureString
        minTemperatureLabel.text = viewModel.minTemperatureString
        maxTemperatureLabel.text = viewModel.maxTemperatureString
        pressureLabel.text = viewModel.pressureTemperatureString
        humidityLabel.text = viewModel.humidityTemperatureString

        
    }
}

