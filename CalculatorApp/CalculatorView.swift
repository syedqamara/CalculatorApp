//
//  CalculatorView.swift
//  CalculatorApp
//
//  Created by Apple on 13/05/2024.
//

import Foundation
import SwiftUI

/*
 Double: -1633200000.0 .. 0 .. 1633200000.0
 Float: -16332.0 .. 0 .. 16332.0
 Int: -16332 .. 0 .. 16332
 String: 23456789iuytredfghjkkjhsw45yuijhgfde5678i76543wedfghj
 */

enum CalculationType: String, Hashable, Identifiable {
    case plus
    case subtraction
    case multiply
    case division
    
    var id: String { rawValue }
}

enum HumanHeightTypes: Float {
    case child = 3
    case younge = 5
    case man = 5.5
    
}

extension String: Identifiable {
    public var id: String { self }
}

struct CalculatorView: View {
    
    @StateObject var viewModel = CalculatorViewModel()
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TextField("Enter first value", text: $viewModel.firstValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter second value", text: $viewModel.secondValue)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Picker("", selection: $viewModel.selectedCalculationType) {
                ForEach(viewModel.allCalculationTypes) { type in
                    Text(type.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            if let answer = viewModel.answer {
                Text(answer)
                    .font(.title.bold())
                    .foregroundStyle(.blue)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
            }
            
            Button {
                viewModel.calculate()
            } label: {
                Text("Calculate")
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    CalculatorView()
}
