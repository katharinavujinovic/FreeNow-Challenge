//
//  NearbyError.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 07.12.22.
//

import Foundation
import SwiftUI

enum NearbyError: Error {
    
    case noVehiclesNearby
    case networkingError
    case locationError
    
    var errorMessage: String {
        switch self {
        case .noVehiclesNearby:
            return "no Vehicles"
        case .networkingError:
            return "no internet"
        case .locationError:
            return "Location error"
        }
    }
    
    var errorImage: Image {
        switch self {
        case .noVehiclesNearby:
            return Image(systemName: "clear.fill")
        case .networkingError:
            return Image(systemName: "wifi.exclamationmark")
        case .locationError:
            return Image(systemName: "location.slash.fill")
        }
    }
    
}
