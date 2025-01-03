//
//  ActionsListView.swift
//  Touch Grass
//
//  Created by Till Brügmann on 03.01.25.
//

import StoreKit
import SwiftUI

struct ActionsListView: View {
    @Namespace var namespace
    @AppStorage("Step Goal") var stepGoal: Double = 10000
    
    var current: Double
    let id = "com.stoobit.touchgrass.lifetime"
    
    var body: some View {
        List {
            Section {
                ProductView(id: id)
                    .productViewStyle(.compact)
                    .listRowBackground(BackgroundView(.decent))
                    .onInAppPurchaseStart(perform: { _ in })
                    .onInAppPurchaseCompletion { _, result in
                        if case .success(.success(_)) = result {
                            
                        }
                    }
            }
            
            Button(action: {}) {
                Label("History", systemImage: "clock.arrow.circlepath")
            }
            
            Button(action: {}) {
                Label("Statistics", systemImage: "chart.bar.xaxis")
            }
            
            Section("Settings") {
                VStack {
                    HStack {
                        Label("Goal", systemImage: "figure.walk")
                        Spacer()
                        Text("\(stepGoal.formatted(.number)) Steps")
                            .foregroundStyle(Color.secondary)
                    }
                    
                    Slider(
                        value: $stepGoal, in: 1000...100000, step: 1000
                    ) { onChange in
                        if stepGoal == 100000 { stepGoal -= 1 }
                    }
                }
                .opacity(current < stepGoal ? 0 : 1)
                .overlay {
                    if current < stepGoal {
                        Text("You can only change your daily goal if you have reached it.")
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                        
                    }
                }
            }
            
            Section {
                Link(destination: URL.applicationDirectory) {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .imageScale(.small)
                        .font(.footnote.bold())
                        .foregroundStyle(Color.secondary)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 17)
                        .background(Color.listRow)
                        .clipShape(.capsule)
                        .labelStyle(.titleAndIcon)
                }
                .frame(maxWidth: .infinity)
                .listRowBackground(Color.clear)
                .buttonStyle(.borderless)
            }
            
            //            Button(action: {  }) {
            //
            //            }
            //            .matchedTransitionSource(id: "zoom", in: namespace)
            //            .navigationDestination(isPresented: <#T##Binding<Bool>#>) {
            //                Text("")
            //                    .navigationTransition(.zoom(
            //                        sourceID: "zoom",
            //                        in: namespace
            //                    ))
            //            }
            
        }
        .environment(\.defaultMinListRowHeight, 53)
        .scrollIndicators(.hidden)
        .labelStyle(ListLabelStyle())
    }
}
