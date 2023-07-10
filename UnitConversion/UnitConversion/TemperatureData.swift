//
//  TemperatureData.swift
//  UnitConversion
//
//  Created by Praveenraj T on 10/07/23.
//

import Foundation

enum Temperatures{
    case celsius
    case fahrenheit
    case kelvin
    
    static func convert(from inputUnit:Temperatures,to outputUnit:Temperatures,value inputValue:Double)->Double{
        var outputValue:Double = inputValue
        switch(inputUnit,outputUnit){
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

extension Temperatures:DataTypeProtocol{
    
    typealias DataType = Self
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
    
    static var defaultInputUnit:Temperatures{
        .celsius
    }
    
    static var defaultOutputUnit:Temperatures{
        .fahrenheit
    }
}
