//
//  ContentView.swift
//  Weather
//
//  Created by ABDUL BASITH A on 26/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
  
    var body: some View {
        NavigationView {
         
            VStack {
                Text(viewModel.timezone).font(.system(size:32))
                Text("\(viewModel.temp)°").font(.system(size:44))
                Text(viewModel.title).font(.system(size:24))
                Text(viewModel.descriptionText).font(.system(size:24))
            }.navigationTitle("Weather")
                .frame(minWidth: 0,  maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                .background(Color(UIColor.darkGray))
                .ignoresSafeArea()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
