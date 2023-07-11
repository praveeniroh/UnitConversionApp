//
//  TemperatureData.swift
//  UnitConversion
//
//  Created by Praveenraj T on 10/07/23.
//

import Foundation

enum TemperatureData{
    case celsius
    case fahrenheit
    case kelvin
    typealias DataType = Self
    static func convert(from inputUnit:TemperatureData,to outputUnit:TemperatureData,value inputValue:Double)->Double{
        var outputValue:Double = inputValue
        switch(inputUnit,outputUnit){
        case (let x,let y) where x == y:
            break
        case (.celsius,.fahrenheit):
            outputValue = 9/5 * inputValue + 32
        case (.celsius,.kelvin):
            outputValue = inputValue + 273.15
        case (.fahrenheit,.celsius):
            outputValue = 5/9*(inputValue - 32)
        case (.fahrenheit,.kelvin):
            outputValue = 5/9*(inputValue - 32) + 273.15
        case (.kelvin,.celsius):
            outputValue = inputValue - 273.15
        case (.kelvin,.fahrenheit):
            outputValue = 9/5 * (inputValue - 273.15) + 32
        default://For same input and output types
            break
        }
        return outputValue
    }
}

extension TemperatureData:DataTypeProtocol{
    static var typeName:String{
        return "Temperature"
    }
    var name:String{
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
    
    var unitSymbol:String{
        switch self {
        case .celsius:
            return "\u{00B0}C"
        case .fahrenheit:
            return "\u{00B0}F"
        case .kelvin:
            return "\u{00B0}K"
        }
    }
    
    static var defaultInputUnit:TemperatureData{
        .celsius
    }
    
    static var defaultOutputUnit:TemperatureData{
        .fahrenheit
    }
}
