//
//  View.swift
//  MovieApp
//
//  Created by Ahmet Bostanci on 24.04.2025.
//

import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size: CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
}


/*
    Text("Hello")
        .poppins(.medium, 18)
 
 */
