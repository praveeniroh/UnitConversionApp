//
//  LengthData.swift
//  UnitConversion
//
//  Created by Praveenraj T on 11/07/23.
//

import Foundation

enum LengthData:DataTypeProtocol{
    case meter
    case kiloMeter
    case feet
    case yard
    case miles
    
    typealias DataType = Self

}

extension LengthData{
    static var typeName:String{
        return "Length"
    }
    var name: String{
        switch self {
        case .meter:
            return "Meter"
        case .kiloMeter:
            return "Kilometer"
        case .feet:
            return "Feet"
        case .yard:
            return "Yard"
        case .miles:
            return "Miles"
        }
    }
    
    var unitSymbol: String{
        switch self {
        case .meter:
            return "m"
        case .kiloMeter:
            return "km"
        case .feet:
            return "ft"
        case .yard:
            return "yd"
        case .miles:
            return "mi"
        }
    }
    
    static var defaultInputUnit: LengthData{
        return .meter
    }
    
    static var defaultOutputUnit: LengthData{
        return .kiloMeter
    }
    
    static func convert(from inputUnit: LengthData, to outputUnit: LengthData, value inputValue: Double) -> Double {
        var outputValue = inputValue
        switch (inputUnit,outputUnit){
        case (let x,let y) where x==y:
            break
        case (.meter,.kiloMeter):
            outputValue = inputValue / 1000
        case (.meter,.feet):
            outputValue = inputValue * 3.28084
        case (.meter,.yard):
            outputValue = inputValue * 1.0936
        case (.meter,.miles):
            outputValue = inputValue * 0.00062137
        case (.kiloMeter,.meter):
            outputValue = inputValue * 1000
        case (.kiloMeter,.feet):
            outputValue = inputValue * 3280.84
        case (.kiloMeter,.yard):
            outputValue = inputValue * 1093.613298
        case (.kiloMeter,.miles):
            outputValue = inputValue * 0.62137119
        case (.feet,.meter):
            outputValue = inputValue * 0.304
        case (.feet,.kiloMeter):
            outputValue = inputValue * 0.304 / 1000
        case (.feet,.yard):
            outputValue = inputValue / 3
        case (.feet,.miles):
            outputValue = inputValue * 0.000189394
        case (.yard,.meter):
            outputValue = inputValue / 1.0936
        case (.yard,.kiloMeter):
            outputValue = inputValue / 1093.613298
        case (.yard,.feet):
            outputValue = inputValue * 3
        case (.yard,.miles):
            outputValue = inputValue * 0.000568182
        case (.miles,.meter):
            outputValue = inputValue / 0.00062137
        case (.miles,.kiloMeter):
            outputValue = inputValue / 0.62137119
        case (.miles,.feet):
            outputValue = inputValue / 0.000189394
        case (.miles,.yard):
            outputValue = inputValue / 0.000568182
        default:
            break
        }
        return outputValue
    }
}
