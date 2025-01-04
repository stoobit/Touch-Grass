//
//  CustomGaugeStyle.swift
//  Touch Grass
//
//  Created by Till Brügmann on 02.01.25.
//

import SwiftUI

struct StepGaugeStyle: GaugeStyle {
    let style = StrokeStyle(lineWidth: 15, lineCap: .round)

    var current: Double
    var goal: Double

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(.ultraThinMaterial, style: style)
                .rotationEffect(.degrees(135))

            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(Color.white, style: style)
                .rotationEffect(.degrees(135))

            if current >= goal {
                Image(systemName: "party.popper.fill")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.white)
                    .offset(y: -26)

                Text("GOAL REACHED")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .offset(y: 20)
            } else {
                configuration.currentValueLabel?
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.white)
                    .offset(y: -10)

                Text("STEPS")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .offset(y: 20)
            }
        }
        .frame(width: 200)
    }
}
