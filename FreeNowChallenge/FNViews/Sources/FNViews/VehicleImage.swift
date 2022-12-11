//
//  VehicleImage.swift
//  FNViews
//
//  Created by Katharina Vujinovic on 11.12.22.
//

import SwiftUI

struct VehicleImage: View {
    
    let image: Image
    let color: Color
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .scaledToFit()
        }
        .padding(6)
        .background(color)
        .cornerRadius(10)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleImage(image: Image(systemName: "heart"), color: .yellow)
    }
}
