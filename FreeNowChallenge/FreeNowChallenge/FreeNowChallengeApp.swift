//
//  FreeNowChallengeApp.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI
import Fetch

@main
struct FreeNowChallengeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            NearbyView(viewModel: NearbyViewModel())
        }
    }
}
