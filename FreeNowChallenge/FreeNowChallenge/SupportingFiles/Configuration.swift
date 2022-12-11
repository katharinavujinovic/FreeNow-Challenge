//
//  Config.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 08.12.22.
//

import Foundation
import CoreLocation
import MapKit

struct Configuration {
    
    struct Client {
        static var baseURL: URL {
            return URL(string: "https://fake-poi-api.live.free-now.com")!
        }
    }
    
    // currently set to Hamburg
    struct DefaultLocation {
        static let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 53.5488, longitude: 9.9872), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }
    
}
