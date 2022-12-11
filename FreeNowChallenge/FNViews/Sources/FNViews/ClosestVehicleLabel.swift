//
//  ClosestVehicleLabel.swift
//  
//
//  Created by Katharina Müllek on 12.12.22.
//

import SwiftUI

struct ClosestVehicleLabel: View {
    
    var body: some View {
        Label {
            Text("Closest Vehicle")
                .font(.headline)
        } icon: {
            Image(systemName: "heart")
        }
        .foregroundColor(Color.white)
        .padding(6)
        .background(Color.pink)
        .cornerRadius(10)
    }
}

struct ClosestVehicleLabel_Previews: PreviewProvider {
    static var previews: some View {
        ClosestVehicleLabel()
    }
}
