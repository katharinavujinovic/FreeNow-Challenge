//
//  ErrorView.swift
//  FNViews
//  
//
//  Created by Katharina Vujinovic on 11.12.22.
//

import SwiftUI

public struct ErrorView: View {
    
    let errorImage: Image
    let errorMessage: String
    
    public init(errorImage: Image, errorMessage: String) {
        self.errorImage = errorImage
        self.errorMessage = errorMessage
    }
    
    public var body: some View {
        VStack() {
            errorImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
            Text(errorMessage)
                .font(.body)
                .frame(maxWidth: .infinity)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .opacity(0.8)
        )
        .cornerRadius(10)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.pink.ignoresSafeArea()
            ErrorView(errorImage: Image(systemName: "heart"), errorMessage: "whoops")
        }

    }
}
