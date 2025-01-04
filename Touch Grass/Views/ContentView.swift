//
//  ContentView.swift
//  Touch Grass
//
//  Created by Till Brügmann on 02.01.25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isAppUnlocked") var isAppUnlocked: Bool = false
    @AppStorage("Step Goal") var stepGoal: Double = 10000
    
    @State var currentSteps: Double = 6000

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Gauge(value: currentSteps, in: 0...stepGoal, label: {}) {
                    Text("\(currentSteps.formatted(.number))")
                } minimumValueLabel: {
                    Text(0.formatted(.number))
                } maximumValueLabel: {
                    Text(stepGoal.formatted(.number))
                }
                .gaugeStyle(
                    StepGaugeStyle(
                        current: currentSteps,
                        goal: stepGoal
                    )
                )
                .frame(maxWidth: .infinity)
                
                AboutView()
                   
                Label("Settings", systemImage: "gearshape.fill")
                    .imageScale(.medium)
                    .font(.footnote.bold())
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 12)
                    .background(.thinMaterial)
                    .clipShape(.capsule)
                    .labelStyle(.titleAndIcon)
                    .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
            .background(BackgroundView())
            .toolbar { Text("") }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
