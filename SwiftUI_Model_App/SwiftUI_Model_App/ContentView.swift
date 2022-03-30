//
//  ContentView.swift
//  SwiftUI_Model_App
//
//  Created by ABDUL BASITH A on 30/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowModel:Bool = false
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            Button(action: {
                isShowModel.toggle()
            }, label: {
                Text("Open Model")
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            .offset(y:-100)
            
            ModalView(isShowModal: $isShowModel)
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .statusBar(hidden: true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
