//
//  PageControl.swift
//  Slider App
//
//  Created by ABDUL BASITH A on 24/01/22.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
   
    var maxPages: Int
    var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.backgroundStyle = .minimal
        control.numberOfPages = maxPages
        control.currentPage = currentPage
    
        
        return control
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.currentPage = currentPage
    }
    
  
}
