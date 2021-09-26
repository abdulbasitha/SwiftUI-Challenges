//
//  ContentView.swift
//  Weather
//
//  Created by ABDUL BASITH A on 26/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    private func setCurrentLocation() {
 
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(viewModel.timezone).font(.system(size:32))
                Text(viewModel.temp).font(.system(size:44))
                Text(viewModel.title).font(.system(size:24))
                Text(viewModel.descriptionText).font(.system(size:24))
//                if locationManager.location != nil {
//                    Text("\(locationManager.location?.coordinate.latitude ?? 0.0) ")
//                }
            }.navigationTitle("Weather")
            
         
               
          
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
