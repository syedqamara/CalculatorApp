//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Apple on 13/05/2024.
//

import Foundation


extension Double {
    var isDotZeroAtTheEndOfAnswer: Bool {
        let answerAsInt = Int(self)
        return Double(answerAsInt) == self
    }
}

extension Int {
    var isPositive: Bool { self > 0 }
    var isNegative: Bool { self < 0 }
}

class CalculatorViewModel: ObservableObject {
    @Published var firstValue: String = ""
    @Published var secondValue: String = ""
    @Published var selectedCalculationType: CalculationType = .plus
    @Published var allCalculationTypes: [CalculationType] = [.plus, .subtraction, .division, .multiply]
    
    @Published var answer: String? = nil
    
    var some = 0
    
    init() {  }
    
    func calculate() {
        let firstValueAsDouble = Double(firstValue) ?? 0.0
        let secondValueAsDouble = Double(secondValue) ?? 0.0
        
        let answerAsDouble = calculate(first: firstValueAsDouble, second: secondValueAsDouble, type: selectedCalculationType)
        
        if answerAsDouble.isDotZeroAtTheEndOfAnswer {
            answer = "\(selectedCalculationType.rawValue): \(Int(answerAsDouble))"
        } else {
            answer = "\(selectedCalculationType.rawValue): \(answerAsDouble)"
        }
    }
    private func calculate(first: Double, second: Double, type: CalculationType) -> Double {
        switch type {
        case .plus:
            return first + second
        case .subtraction:
            return first - second
        case .multiply:
            return first * second
        case .division:
            return first / second
        }
    }
}
