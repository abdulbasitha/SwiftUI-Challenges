//
//  Models.swift
//  Weather
//
//  Created by ABDUL BASITH A on 26/09/21.
//

import Foundation

struct WeatherModel: Codable {
    let timezone: String
    let currently: CurrentWeather
}

struct CurrentWeather: Codable {
    let temperature:Float
    let summary: String
}

