//
//  ModalView.swift
//  SwiftUI_Modal_App
//
//  Created by ABDUL BASITH A on 31/03/22.
//

import SwiftUI

struct ModalView: View {
    @Binding var isShowModal:Bool
    
    @State var isDragging = false
    
    @State private var currentHeight:CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    let startOpacity:Double = 0.4
    let endOpacity:Double = 0.8
    
    var percentage: Double {
        let res = Double((currentHeight - minHeight) / (maxHeight - minHeight))
        
        return max(0, min(1, res))
    }
    
    
    var body: some View {
        ZStack(alignment:.bottom) {
            if isShowModal {
                Color.black
                    .opacity(startOpacity + (endOpacity - startOpacity) * percentage)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowModal = false
                    }
                mainView
                    .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeOut)
    }
    
    var mainView: some View {
        VStack {
            
            ZStack {
                Capsule()
                    .frame(width: 40, height: 6)
                }
            .frame(height:40)
            .frame(maxWidth:.infinity)
            .background(Color.white.opacity(0.000001))
            .gesture(dragGesture)
            
            ZStack {
                VStack {
                    Text("\"No Pain No Gain !\"")
                        .font(.system(size: 25, weight: .regular))
                        .multilineTextAlignment(.center)
                    Text("@shahabz")
                        .font(.system(size: 20, weight: .regular))
                }
                .padding(.horizontal, 30)
            }
            .frame(maxHeight:.infinity)
            .padding(.bottom, 35)
           
        }
        .frame(height:currentHeight)
        .frame(maxWidth:.infinity)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height:currentHeight/2)
            }
                .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut)
    }
    @State private var prevDragTranslation = CGSize.zero
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                
                if !isDragging {
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTranslation.height
             
                if currentHeight > maxHeight || currentHeight < minHeight {
                    currentHeight -= dragAmount / 6
                } else {
                    currentHeight -= dragAmount
                }
                
                
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = CGSize.zero
                isDragging = false
                
                if currentHeight > maxHeight {
                    currentHeight = maxHeight
                }
                else if currentHeight < maxHeight {
                    currentHeight = minHeight
                }
            }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isShowModal: .constant(true))
    }
}
