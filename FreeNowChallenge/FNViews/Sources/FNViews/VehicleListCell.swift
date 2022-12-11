//
//  VehicleListCell.swift
//  FNViews
//
//  Created by Katharina Vujinovic on 11.12.22.
//

import SwiftUI

public struct VehicleListCell: View {
    
    var distance: String
    var vehicleId: Int
    var fleetType: String
    var vehicleState: String
    var vehicleImage: Image
    var vehicleColor: Color
    
    public init(distance: String, vehicleId: Int, fleetType: String, vehicleState: String, vehicleImage: Image, vehicleColor: Color) {
        self.distance = distance
        self.vehicleId = vehicleId
        self.fleetType = fleetType
        self.vehicleState = vehicleState
        self.vehicleImage = vehicleImage
        self.vehicleColor = vehicleColor
    }
    
    public var body: some View {
        HStack() {
            VehicleImage(image: vehicleImage, color: vehicleColor)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                HStack() {
                    Text(fleetType)
                        .font(.headline)
                    Text(vehicleState)
                        .font(.body)
                }
                Text(distance)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct VehicleListCell_Previews: PreviewProvider {
    static var previews: some View {
            VehicleListCell(distance: "12m", vehicleId: 12, fleetType: "TAXI", vehicleState: "ACTIVE", vehicleImage: Image(systemName: "car.fill"), vehicleColor: .yellow)
    }
}
