//
//  Home.swift
//  Slider App
//
//  Created by ABDUL BASITH A on 23/01/22.
//

import SwiftUI

struct Home: View {
    @State var selectedTab: Trip = trips[0]
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let frame = proxy.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:  frame.width, height: frame.height)
                    .cornerRadius(0)
            }
            .ignoresSafeArea()
            VStack {
                Text("Let's Go With")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Let's Go With")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                
                VStack {
                    GeometryReader { proxy in
                        let frame = proxy.frame(in: .global)
                        
                        TabView(selection: $selectedTab) {
                            ForEach(trips) { trip in
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: frame.width, height: frame.height, alignment: .center)
                                    .cornerRadius(4)
                                    .tag(trip)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }
                    .frame(height: UIScreen.main.bounds.height / 2.2)
                    Text(selectedTab.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, 18)
                    
                    PageControl(maxPages: trips.count, currentPage: getIndex())
                    
                }
                .padding(.top)
                .padding(.horizontal)
                
                .background(Color.white.clipShape(CustomShape()).cornerRadius(10))
                .padding(.horizontal, 20)
                
                
                
                Button(action: {}, label: {
                    Text("GET STARTED")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(Color("blue"))
                        .cornerRadius(10)
                    
                })
                    .padding(.top, 30)
            }
            .padding()
        }
    }
    func getIndex()-> Int {
        let index = trips.firstIndex { (trip) -> Bool in
           
            return selectedTab.id == trip.id
        } ?? 0
        print("DEBUG\(index)")
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
