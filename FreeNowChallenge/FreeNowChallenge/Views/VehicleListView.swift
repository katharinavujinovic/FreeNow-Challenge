//
//  VehicleListView.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI

struct VehicleListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let vehicles: [VehiclePOI]?
    let error: NearbyError?
    
    var body: some View {
        VStack {
            
            if let error = error {
                VStack() {
                    error.errorImages
                        .resizable()
                        .scaledToFit()
                    Text(error.errorMessage)
                        .font(.headline)
                }
            }
            if let vehicles = vehicles {
                List {
                    ForEach(vehicles) { vehicle in
                        // can be put in a new one!
                        HStack() {
                            vehicle.fleetImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 40)
                                .cornerRadius(10)
                            VStack(alignment: .leading) {
                                HStack() {
                                    Text(vehicle.vehicle.fleetType.rawValue)
                                        .font(.headline)
                                    Text(vehicle.vehicle.state.rawValue)
                                        .font(.body)
                                }
                                if let distanceInMeter = vehicle.distanceInMeter {
                                    Text(distanceInMeter)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }

    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView(vehicles: [VehiclePOI(vehicle: Vehicle(id: 12, coordinate: Coordinate(latitude: 53.5786019615793, longitude: 9.865631461143494), state: .vehicleIsActive, fleetType: .taxi, heading: 77.98233032226562))], error: nil)
        }
}
