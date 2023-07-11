//
//  TimeData.swift
//  UnitConversion
//
//  Created by Praveenraj T on 11/07/23.
//

import Foundation

enum TimeData{
    case seconds, minutes, hours, days
    typealias DataType = Self

}
extension TimeData:DataTypeProtocol{
    var name: String {
        switch self {
        case .seconds:
            return "seconds"
        case .minutes:
            return "minutes"
        case .hours:
            return "hours"
        case .days:
            return "days"
        }
    }
    
    var unitSymbol: String {
        switch self {
        case .seconds:
            return "s"
        case .minutes:
            return "min."
        case .hours:
            return "h"
        case .days:
            return "d"
        }
    }
    
    static var defaultInputUnit: TimeData {
        return .seconds
    }
    
    static var defaultOutputUnit: TimeData {
        return .minutes
    }
    
    static var typeName: String {
        "Time"
    }
    
    static func convert(from inputUnit: TimeData, to outputUnit: TimeData, value inputValue: Double) -> Double {
        var outputValue = inputValue
        switch(inputUnit,outputUnit){
        case (.seconds,.minutes):
            outputValue = inputValue / 60
        case (.seconds,.hours):
            outputValue = inputValue / (60 * 60)
        case (.seconds,.days):
            outputValue = inputValue / (60 * 60 * 24)
        case (.minutes,.seconds):
            outputValue = inputValue * 60
        case (.minutes,.hours):
            outputValue = inputValue / 60
        case (.minutes,.days):
            outputValue = inputValue / (60 * 24)
        case (.hours,.seconds):
            outputValue = inputValue * 60 * 60
        case (.hours,.minutes):
            outputValue = inputValue * 60
        case (.hours,.days):
            outputValue = inputValue / 24
        case (.days,.seconds):
            outputValue = inputValue * 60 * 60 * 24
        case (.days,.minutes):
            outputValue = inputValue * 60 * 24
        case (.days,.hours):
            outputValue = inputValue * 24
        default :
            break
        }
        return outputValue
    }
    
    
}
