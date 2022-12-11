//
//  VehiclePOI.swift
//  FreeNowChallenge
//
//  Created by Katharina Müllek on 08.12.22.
//

import Foundation
import SwiftUI

struct VehiclePOI: Identifiable {
    
    var vehicle: Vehicle
    var distanceToUser: Double?
    
    var id: ObjectIdentifier {
        return vehicle.id
    }
    
    var fleetImage: Image {
        switch vehicle.fleetType {
        case .taxi:
            return Image(systemName: "car.fill")
        }
    }
    
    var fleetColor: Color {
        switch vehicle.fleetType {
        case .taxi:
            return .yellow
        }
    }
    
    var distanceInMeter: String? {
        guard let distanceToUser = distanceToUser else { return nil }
        
        if distanceToUser > 1000 {
            let distanceInKm = distanceToUser / 1000
            return "\(String(format: "%.2f", distanceInKm)) km"
        } else {
            return "\(Int(distanceToUser)) m"
        }
    }
}
