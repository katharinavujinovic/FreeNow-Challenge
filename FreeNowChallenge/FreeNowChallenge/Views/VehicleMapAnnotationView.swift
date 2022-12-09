//
//  VehicleMapAnnotationView.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 07.12.22.
//

import SwiftUI

struct VehicleMapAnnotationView: View {
    
    @State var vehicle: VehiclePOI
    
    var body: some View {
        VStack(spacing: 0) {
            vehicle.fleetImage
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
        }
    }
}

struct VehicleMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleMapAnnotationView(vehicle: VehiclePOI(vehicle: Vehicle(id: 12, coordinate: Coordinate(latitude: 53.5786019615793, longitude: 9.865631461143494), state: .vehicleIsActive, fleetType: .taxi, heading: 77.98233032226562)))
    }
}
