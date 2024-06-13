//
//
// StepTracker
// HealthKitPermissionPrimingView.swift
//
// Created by jjbuell-dev
// Copyright © Royal Blue Software
//


import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {
    
    // MARK: - Environment Properties
    
    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) private var dismiss
    
    @State private var isShowingHealthKitPermissions = false
    @Binding var hasSeen: Bool
    
    // MARK: - Properties
    
    var description = """
    This app displays you step and weight data in interactive charts.
    
    You can also add new step or weight data to Apple Health from this app.  Your data is private and secured.
    """
    
    // MARK: - Body View
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading, spacing: 10) {
                
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                
                Text("Apple Health Integration")
                    .font(.title2).bold()
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Connect Apple Health") {
                isShowingHealthKitPermissions = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
        .onAppear { hasSeen = true } // toggles to true so the PrimingView only shows 1x
        .healthDataAccessRequest(
            store: hkManager.store,
            shareTypes: hkManager.types,
            readTypes: hkManager.types,
            trigger: isShowingHealthKitPermissions) { result in
                switch result {
                case .success(_):
                    dismiss()
                case .failure(_):
                    // TODO: - code to handle error
                    dismiss()
                }
            }
    }
}

#Preview {
    HealthKitPermissionPrimingView(hasSeen: .constant(true))
        .environment(HealthKitManager())
}
