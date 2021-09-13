//
//  ContentView.swift
//  Glassmorphism
//
//  Created by ABDUL BASITH A on 13/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7602591409, green: 0.8843609125, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).opacity(0.0)]), startPoint: .top, endPoint: .bottom)
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)).opacity(0.3), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)).opacity(0.6)]), startPoint: .leading, endPoint: .bottomTrailing)
            ZStack {
                Circle()
                    .frame(width: 400, height: 400)
                    .offset(x: 150, y: -200)
                    .foregroundColor(Color(#colorLiteral(red: 0.7821142663, green: 0.9927107031, blue: 1, alpha: 1)).opacity(0.5))
                    .blur(radius: 8)
                Circle()
                    .frame(width: 300, height: 300)
                    .offset(x: -100, y: -125)
                    .foregroundColor(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)).opacity(0.5))
                    .blur(radius: 8)
                    
                PopupView()
            }
           
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PopupView: View {
    var body: some View {
        ZStack(alignment:.topLeading) {
            Color.white.opacity(0.4).frame(width: 300, height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .blur(radius: 1)
            VStack(alignment:.leading, spacing: 16){
                Text("Glassmorphism").font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.8))
                Text("This is Glassmorphism of SwitfUI".uppercased()).font(.caption)
                Text("This could be be your body text...")
                    .font(.footnote)
            }
            .padding()
            .frame(width: 300, height: 400)
        }
    }
}
