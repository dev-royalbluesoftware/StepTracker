//
//
// StepTracker
// StepTrackerApp.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import SwiftUI

@main
struct StepTrackerApp: App {
    
    // MARK: - HealthKit Manager
    
    let hkManager = HealthKitManager()  // app will have access
    
    // MARK: - Body Scene
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)  // every view will have access to this - because it is injected on DashboardView
        }
    }
}
