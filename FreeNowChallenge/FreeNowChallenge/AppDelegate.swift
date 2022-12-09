//
//  AppDelegate.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 08.12.22.
//

import UIKit
import Fetch

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        let config = Config(baseURL: Configuration.Client.baseURL,
                            cache: MemoryCache(defaultExpiration: .seconds(3600)))
        APIClient.shared.setup(with: config)
        
        return true
    }
}
