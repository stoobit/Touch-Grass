//
//  AboutView.swift
//  Touch Grass
//
//  Created by Till Brügmann on 04.01.25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GeometryReader { proxy in
            let height = proxy.size.height * 0.5
            let width = proxy.size.width
            let circle: CGFloat = 50

            Rectangle()
                .frame(width: 2, height: height)
                .overlay(alignment: .leading) {
                    HStack {
                        Circle()
                            .frame(width: circle, height: circle)
                            .foregroundStyle(.thinMaterial)
                            .overlay {
                                Image(systemName: "flag.2.crossed.fill")
                            }

                        Text("Set yourself a step goal.")
                            .fontWeight(.medium)
                            .padding(.leading)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .frame(width: width * 0.8, alignment: .leading)
                    .offset(x: -(circle - 2) / 2, y: -circle / 2)

                    HStack {
                        Circle()
                            .frame(width: circle, height: circle)
                            .foregroundStyle(.thinMaterial)
                            .overlay {
                                Image(systemName: "figure.walk")
                            }

                        Text("Walk or run to reach your goal.")
                            .fontWeight(.medium)
                            .padding(.leading)
                    }
                    .frame(width: width * 0.8, alignment: .leading)
                    .offset(x: -(circle - 2) / 2)

                    HStack {
                        Circle()
                            .frame(width: circle, height: circle)
                            .foregroundStyle(.thinMaterial)
                            .overlay {
                                Image(systemName: "party.popper.fill")
                            }

                        Text(
                            "Enjoy social media and gaming without a bad conscience."
                        )
                        .fontWeight(.medium)
                        .padding(.leading)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .frame(width: width * 0.8, alignment: .leading)
                    .offset(x: -(circle - 2) / 2, y: circle / 2)
                }
                .frame(height: height)
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .leading
                )
                .padding(.horizontal, width * 0.2)

        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
    }
}

#Preview {
    AboutView()
}
