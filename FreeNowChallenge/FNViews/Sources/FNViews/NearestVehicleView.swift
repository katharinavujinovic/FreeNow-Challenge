//
//  NearestVehicleView.swift
//  FNViews
//
//  Created by Katharina Vujinovic on 09.12.22.
//

import SwiftUI

public struct NearestVehicleView: View {
    
    let distance: String
    let vehicleId: Int
    let fleetType: String
    let vehicleState: String
    let vehicleImage: Image
    let vehicleColor: Color
    let isClosestVehicle: Bool
    
    public init(distance: String, vehicleId: Int, fleetType: String, vehicleState: String, vehicleImage: Image, vehicleColor: Color, isClosestVehicle: Bool = false) {
        self.distance = distance
        self.vehicleId = vehicleId
        self.fleetType = fleetType
        self.vehicleState = vehicleState
        self.vehicleImage = vehicleImage
        self.vehicleColor = vehicleColor
        self.isClosestVehicle = isClosestVehicle
    }
    
    public var body: some View {
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 25) {
                if isClosestVehicle {
                    ClosestVehicleLabel()
                }
                
                VStack(alignment: .leading) {
                    Label {
                        Text(distance)
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } icon: {
                        Image(systemName: "figure.walk")
                    }
                    Text("\(vehicleId)")
                        .font(.footnote)
                }
            }
            
            VStack(alignment: .trailing, spacing: 16) {
                VehicleImage(image: vehicleImage, color: vehicleColor)
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .trailing) {
                    Text(fleetType)
                        .font(.body)
                    Text(vehicleState)
                        .font(.footnote)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .opacity(0.8)
                .offset(y: 50)
        )
        .cornerRadius(10)


    }
}

struct NearestVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            NearestVehicleView(distance: "50m", vehicleId: 1, fleetType: "TAXI", vehicleState: "ACTIVE", vehicleImage: Image(systemName: "car.fill"), vehicleColor: .yellow, isClosestVehicle: true)
        }
    }
}
