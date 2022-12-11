//
//  VehicleListView.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI
import FNViews

struct VehicleListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel: NearbyViewModel
    
    let vehicles: [VehiclePOI]
    
    var body: some View {
        VStack {
            List {
                ForEach(vehicles) { vehicle in
                    VehicleListCell(distance: vehicle.distanceInMeter ?? "",
                                    vehicleId: vehicle.vehicle.id,
                                    fleetType: vehicle.vehicle.fleetType.rawValue,
                                    vehicleState: vehicle.vehicle.state.rawValue,
                                    vehicleImage: vehicle.fleetImage,
                                    vehicleColor: vehicle.fleetColor)
                    .onTapGesture {
                        viewModel.selectedPOI = vehicle
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView(viewModel: NearbyViewModel(), vehicles: [VehiclePOI(vehicle: Vehicle(id: 12, coordinate: Coordinate(latitude: 53.5786019615793, longitude: 9.865631461143494), state: .vehicleIsActive, fleetType: .taxi, heading: 77.98233032226562))])
        }
}
