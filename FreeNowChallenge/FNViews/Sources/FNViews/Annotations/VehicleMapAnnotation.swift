//
//  VehicleMapAnnotation.swift
//  FNViews
//
//  Created by Katharina Vujinovic on 07.12.22.
//

import SwiftUI

public struct VehicleMapAnnotation: View {
    
    public var vehicleImage: Image
    
    public init(vehicleImage: Image) {
        self.vehicleImage = vehicleImage
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            vehicleImage
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding(10)
                .background(Color.yellow)
                .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -2)
        }
    }
}

struct VehicleMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleMapAnnotation(vehicleImage: Image(systemName: "heart"))
    }
}
