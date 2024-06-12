//
//
// StepTracker
// HealthKitManager.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
// 


import Foundation
import HealthKit
import Observation  // new iOS 17 - replaces Observable Object

@Observable class HealthKitManager {
    
    // MARK: - Properties
    
    let store = HKHealthStore()  // create 'HealthKit Store' - required step from HealthKit documentation
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
