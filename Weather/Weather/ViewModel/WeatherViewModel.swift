//
//  ViewModel.swift
//  Weather
//
//  Created by ABDUL BASITH A on 26/09/21.
//

import Foundation
import SwiftUI
import CoreLocation

class WeatherViewModel: ObservableObject {

    @ObservedObject private var location = LocationManager.shared
    @Published var title: String = "_"
    @Published var descriptionText: String = "_"
    @Published var temp: String = "_"
    @Published var timezone: String = "_"
    
   
    
    
   init(){
       location.getUserLocation { location in
           self.fetchWeather(location: location)
       }
       
    }

    func fetchWeather(location: CLLocation?) {
        let long = location!.coordinate.longitude
        let lat = location!.coordinate.longitude 
        
        print("https://api.darksky.net/forecast/ddcc4ebb2a7c9930b90d9e59bda0ba7a/\(lat),\((long))?exclude=[flags,minutely]")
        guard let url = URL(string: "https://api.darksky.net/forecast/ddcc4ebb2a7c9930b90d9e59bda0ba7a/\(lat),\(long)?exclude=[flags,minutely]") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data , error == nil else {
                return
            }

            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.sync {
                    self.title = model.currently.summary ?? "No title"
                    self.timezone = model.timezone
                    self.temp = "\(model.currently.temperature)"
                }
            }
            catch {
                print("failed")
            }
            // convert to to model
        }
        task.resume()
    }
  
}
