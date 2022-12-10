//
//  NearestVehicleView.swift
//  FreeNowChallenge
//
//  Created by Katharina Müllek on 09.12.22.
//

import SwiftUI

struct NearestVehicleView: View {
    
    let vehiclePOI: VehiclePOI
    var isClosestVehicle: Bool = true
    
    var body: some View {
        HStack(alignment: .bottom) {
            
            VStack(alignment: .leading, spacing: 25) {
                if isClosestVehicle {
                    Label {
                        Text("Closest Vehicle")
                            .font(.headline)
                    } icon: {
                        Image(systemName: "heart")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: .infinity, height: .infinity)
                        .padding(6)
                        .background(Color.pink)
                        .cornerRadius(10)
                }
                
                VStack(alignment: .leading) {
                    Label {
                        Text(vehiclePOI.distanceInMeter ?? "50m")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    } icon: {
                        Image(systemName: "figure.walk")
                    }
                    Text(vehiclePOI.vehicle.id.description)
                        .font(.footnote)
                }
            }
            
            VStack(alignment: .trailing, spacing: 16) {
                imageSection
                
                VStack(alignment: .trailing) {
                    Text(vehiclePOI.vehicle.fleetType.rawValue)
                        .font(.body)
                    Text(vehiclePOI.vehicle.state.rawValue)
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

extension NearestVehicleView {
    
    private var imageSection: some View {
        ZStack {
            vehiclePOI.fleetImage
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        .padding(6)
        .background(Color.yellow)
        .cornerRadius(10)
    }
    
}

struct NearestVehicleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            NearestVehicleView(vehiclePOI: VehiclePOI(vehicle: Vehicle(id: 12, coordinate: Coordinate(latitude: 53.5786019615793, longitude: 9.865631461143494), state: .vehicleIsActive, fleetType: .taxi, heading: 77.98233032226562)))
        }
    }
}
