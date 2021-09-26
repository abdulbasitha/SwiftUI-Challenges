//
//  ContentView.swift
//  FitnessApp
//
//  Created by ABDUL BASITH A on 22/09/21.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        VStack{
           
        }.background(Image("Landing"))
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 8")
        LandingView().previewDevice("iPhone 11 Pro")
        LandingView().previewDevice("iPhone 11 Pro Max")
    }
}
