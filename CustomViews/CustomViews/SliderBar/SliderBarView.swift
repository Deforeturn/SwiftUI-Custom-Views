//
//  SliderBarView.swift
//  CustomViews
//
//  Created by JiHoon K on 6/20/24.
//

import SwiftUI

struct SliderBarView<V>: View where V: BinaryFloatingPoint {
    let title: String
    @Binding var value: V
    let maxValue: V
    let isDecimal: Bool
    
    private var displayValue: String {
        (value * maxValue).formatToDecimalString(3)
    }
    @State private var steps: Int = 1
    private let hapticGenerator = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(title)
                    Image(systemName: "info.circle")
                        .font(.caption2)
                        .opacity(0.8)
                }
                Spacer()
                Text(displayValue)
                    .opacity(0.8)
            }

            progressBar()
                .frame(height: 5)
        }
        .padding()
        .onAppear {
            value /= maxValue
            steps = isDecimal ? Int(maxValue) * 10 : Int(maxValue)
        }
    }
    
    private func progressBar() -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: proxy.size.width)
                    .opacity(0)
                    .background(.bar)

                Rectangle()
                    .frame(width: min(CGFloat(value) * proxy.size.width,
                                      proxy.size.width))
                    .foregroundColor(.accentColor)
                    .animation(.interpolatingSpring, value: value)
            }
            .clipShape(RoundedRectangle(cornerRadius: proxy.size.width / 2, style: .continuous))
            .gesture(
                DragGesture(minimumDistance: 5, coordinateSpace: .local)
                    .onChanged({ gesValue in
                        updateValue(proxy: proxy, gesValue: gesValue)
                    })
            )
        }
    }
}

extension SliderBarView {
    private func updateValue(proxy: GeometryProxy, gesValue: DragGesture.Value) {
        let stepWidth = proxy.size.width / CGFloat(steps)
        let stepIndex = Int(gesValue.location.x / stepWidth)
        let newValue = max(min(V(stepIndex) / V(steps), 1.0), 0)
         
        if value !=  V(newValue) {
            DispatchQueue.main.async {
                hapticGenerator.impactOccurred(intensity: CGFloat(max(newValue, 0.3)))
                value = V(newValue)
            }
        }
    }
}

@available(iOS 18, *)
#Preview {
    @Previewable @State var value: Double = 0
    let maxValue: Double = 10
    
    SliderBarView(title: "Title", value: $value, maxValue: maxValue, isDecimal: true)
}
