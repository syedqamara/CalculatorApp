//
//  ContentView.swift
//  CalculatorApp
//
//  Created by Apple on 07/05/2024.
//

import SwiftUI

/*
 Double: -1633200000.0 .. 0 .. 1633200000.0
 Float: -16332.0 .. 0 .. 16332.0
 Int: -16332 .. 0 .. 16332
 String: 23456789iuytredfghjkkjhsw45yuijhgfde5678i76543wedfghj
 */

struct ContentView: View {
    @State var firstValue: String = ""
    @State var secondValue: String = ""
    @State var answer: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Enter first value", text: $firstValue)
            TextField("Enter second value", text: $secondValue)
            
            if let answer {
                Text(answer)
                    .font(.title.bold())
                    .foregroundStyle(.blue)
            }
            Button {
                let firstValueAsDouble = Double(firstValue) ?? 0.0
                let secondValueAsDouble = Double(secondValue) ?? 0.0
                
                let answerAsDouble = firstValueAsDouble + secondValueAsDouble
                let answerAsInt = Int(answerAsDouble)
                let isDotZeroAtTheEndOfAnswer = Double(answerAsInt) == answerAsDouble
                
                if isDotZeroAtTheEndOfAnswer {
                    answer = "Addtion: \(answerAsInt)"
                } else {
                    answer = "Addtion: \(answerAsDouble)"
                }
                
            } label: {
                Text("Addition")
            }

        }
    }
}

#Preview {
    ContentView()
}
