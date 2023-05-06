//
//  SplashViewModel.swift
//  StudentsScheduler
//
//  Created by rares on 12.03.2023.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var isLoading = false
    @Published var isNavigationActive = false
    
    func loadData() {
        // Set isLoading to true to display the loading indicator
        isLoading = true
        
        // Load your data in the background
        DispatchQueue.global(qos: .background).async {
            // Simulate loading data for 2 seconds
            sleep(2)
            
            // Once the data is loaded, set isLoading to false and navigate to the Home view
            DispatchQueue.main.async { [self] in
                isLoading = false
                isNavigationActive = true
            }
        }
    }
}
