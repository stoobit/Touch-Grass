//
//  ContentView.swift
//  Touch Grass
//
//  Created by Till Brügmann on 02.01.25.
//

import SwiftUI

struct ContentView: View {
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
                .background(alignment: .bottom) {
                    BackgroundView()
                }

                ActionsListView(current: currentSteps)
                    .frame(maxHeight: .infinity)
                    .overlay(alignment: .bottom) {
                        ShareLink(item: URL(string: "https://stoobit.com")!) {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .imageScale(.small)
                                .font(.footnote.bold())
                                .foregroundStyle(Color.secondary)
                                .padding(.vertical, 7)
                                .padding(.horizontal, 17)
                                .background(Color.primary.opacity(0.1))
                                .background(.listRow)
                                .clipShape(.capsule)
                                .labelStyle(.titleAndIcon)
                        }
                    }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text("")
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.light)
}
